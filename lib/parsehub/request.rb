module Parsehub
  class Request
    attr_reader :config, :method, :endpoint, :params

    def initialize(method, endpoint, params = {})
      @config   = Parsehub.configuration
      @method   = method
      @endpoint = endpoint
      @params   = params.merge!(api_key: config.api_key)
    end

    def send
      url = [config.host, @endpoint].join('/')

      uri = URI.parse(url)
      uri.query = URI.encode_www_form(@params)

      request = case @method
                when :get
                  Net::HTTP::Get.new(uri.request_uri)
                when :post
                  Net::HTTP::Post.new(uri.request_uri)
                when :delete
                  Net::HTTP::Delete.new(uri.request_uri)
                else
                  raise 'HTTP method not supported'
                end

      request["User-Agent"] = "Parsehub Ruby gem v#{Parsehub::VERSION}"

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      response = http.request(request)

      Parsehub::Response.new(response)
    end
  end
end
