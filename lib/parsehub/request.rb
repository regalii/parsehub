module Parsehub
  class Request
    attr_reader :config, :method, :endpoint, :params

    def initialize(method, endpoint, params = {})
      @config   = Parsehub.configuration
      @method   = method
      @endpoint = endpoint
      @params   = params.merge!(api_key: config.api_key)
    end

    def method_class
      "Net::HTTP::#{@method.capitalize}".split('::').inject(Object) {|o,c| o.const_get c}
    end

    def send
      url = [config.host, @endpoint].join('/')

      uri = URI.parse(url)
      uri.query = URI.encode_www_form(@params)

      request = method_class.new(uri.request_uri)
      request["User-Agent"] = "Parsehub Ruby gem v#{Parsehub::VERSION}"

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      response = http.request(request)

      Parsehub::Response.new(response)
    end
  end
end
