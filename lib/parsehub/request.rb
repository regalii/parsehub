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
      url = [config.host, endpoint].join('/')
      uri = URI.parse(url)

      case method
      when :get
        uri.query = URI.encode_www_form(params)
        request = Net::HTTP::Get.new(uri.request_uri)
      when :post
        request = Net::HTTP::Post.new(uri.request_uri)
        request.set_form_data(params)
      when :delete
        uri.query = URI.encode_www_form(params)
        request = Net::HTTP::Delete.new(uri.request_uri)
      end

      request["User-Agent"] = "Parsehub ruby gem v#{Parsehub::VERSION}"

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      # Parsehub.logger.debug(self) if Parsehub.configuration.logged?

      http_response = http.request(request)

      response = Parsehub::Response.new(http_response)

      # Parsehub.logger.debug(response) if Parsehub.configuration.logged?

      response
    end
  end
end
