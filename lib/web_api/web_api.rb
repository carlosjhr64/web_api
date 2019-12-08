module WEB_API
  class WebApi
    DUMPER = (defined? JSON)? JSON.method(:dump)  : :none

    PARSER = Hash.new :none
    PARSER['application/json'] = JSON.method(:parse)           if defined? JSON
    PARSER['text/csv']         = CSV.method(:parse)            if defined? CSV
    PARSER['text/html']        = Nokogiri::HTML.method(:parse) if defined? Nokogiri

    def initialize(base =  '',
                   type:   :get,
                   data:   {},
                   header: {},
                   dumper: DUMPER,
                   parser: PARSER,
                   &block)
      @base, @type, @data, @header, @dumper, @parser, @block =
       base,  type,  data,  header,  dumper,  parser,  block
      @strict = false
      @webmethods = {}
    end

    def strict!(t = true)
      @strict = t
    end

    def add(method, target =  method.to_s,
                    type:   @type,
                    data:   {},
                    header: {},
                    dumper: @dumper,
                    parser: @parser,
                    &block)
      @webmethods[method] = WebApiMethod.new(@base+target,
                                             type,
                                             @data.merge(data),
                                             @header.merge(header),
                                             dumper,
                                             parser,
                                             &(block || @block))
    end

    def method_missing(symbol , extension =  '',
                                type:   nil,
                                data:   {},
                                header: {},
                                dumper: nil,
                                parser: nil,
                                &block)
      unless @webmethods.has_key? symbol
        super if @strict
        add symbol
      end
      extension, data = '', extension unless extension.is_a? String # user passed data as first argument
      @webmethods[symbol].run(extension, type, data, header, dumper, parser, &block)
    end
  end
end
