module WEB_API
  class WebApiMethod
    class ResponseError < ::RuntimeError
    end
    class UnsupportedMethodError < ::RuntimeError
    end

    OK = 200..299

    # Escapes value's string representation for query string use.
    def escape(value)
      #http://rosettacode.org/wiki/URL_encoding#Ruby
      CGI.escape(value.to_s).gsub("+", "%20")
    end

    def query_string(ah)
      case ah
      when Array
        ah.select{|h| !h.empty?}.map{|h| query_string(h)}.join('&')
      when Hash
        ah.map do |k,v|
          "#{k}=#{escape v}"
        end
        .join('&')
      else
        ah.to_s
      end
    end

    def initialize(target, type, data, header, dumper, parser, &block)
      @target, @type, @data, @header, @dumper, @parser, @block =
       target,  type,  data,  header,  dumper,  parser,  block
    end

    def uri_parse(request)
      uri = URI.parse(request.url)
      request_uri = uri.request_uri
      payload = ''
      unless request.data.empty?
        if request.type == :post
          if dumper=request.dumper and (dumper!=:none)
            payload = dumper.call(request.data)
          else
            payload = query_string(request.data)
          end
        else
          payload = query_string(request.data)
          request_uri += (uri.query ? '&' : '?') + payload
        end
      end
      request.scheme, request.host, request.port, request.uri, request.payload =
          uri.scheme,     uri.host,     uri.port, request_uri,         payload
    end

    def run(extension, type, data, header, dumper, parser, &block)
      request        = CRStruct::Open.new
      request.url    = @target+extension
      request.type   = type || @type
      request.data   = @data.merge(data)
      request.header = @header.merge(header)
      request.dumper = dumper || @dumper

      parser = parser || @parser
      block  = block  || @block

      uri_parse(request)
      block.call(request) if block

      body, content = http_response_body(request)
      parser = parser[content]  if parser.is_a? Hash
      body = parser.call body if parser and parser!=:none
      return body
    end

    def http_response_body(request)
      response = http_response(request)
      raise ResponseError, response.message unless OK === response.code.to_i
      return response.body, response['content-type'].sub(/;.*$/,'')
    end

    def http_response(request)
      http = net_http(request)
      case request.type
      when :get, :delete, :head, :copy, :move, :options, :trace
        http.method(request.type).call request.uri, request.header
      when :post, :patch, :lock, :unlock, :mkcol, :propfind, :proppatch
        http.method(request.type).call request.uri, request.payload, request.header
      else
        raise UnsupportedMethodError, "Method type #{type}(#{type.class}) not supported by WEB_API::WebApi."
      end
    end

    def net_http(request)
      http = Net::HTTP.new(request.host, request.port)
      http.use_ssl = request.scheme=='https'
      return http
    end
  end
end
