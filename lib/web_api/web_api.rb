class WebApi
  def WebApi.get_dumper
    (defined? JSON)? JSON.method(:dump) : :none
  end

  def WebApi.get_parsers
    parsers = Hash.new :none
    parsers['application/json'] = JSON.method(:parse)    if defined? JSON
    parsers['text/csv']  = CSV.method(:parse)            if defined? CSV
    parsers['text/html'] = Nokogiri::HTML.method(:parse) if defined? Nokogiri
    return parsers
  end

  def initialize(base =  '',
                 type:   :get,
                 data:   {},
                 header: {},
                 dumper: WebApi.get_dumper,
                 parser: WebApi.get_parsers,
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
    # user passed data as first argument?
    extension, data = '', extension unless extension.is_a? String
    @webmethods[symbol].run(extension, type, data, header, dumper, parser,
                            &block)
  end
end
