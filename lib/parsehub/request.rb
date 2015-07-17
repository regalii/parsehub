module Parsehub
  class Request
    def initialize(endpoint, params = {})
      @config   = Parsehub.configuration
      @endpoint = endpoint
      @params   = params.merge!(api_key: @config.api_key)
      @uri      = URI.parse([@config.host, @endpoint].join('/'))
    end

    def get
      @uri.query = URI.encode_www_form(@params)
      request = Net::HTTP::Get.new(@uri.request_uri)

      send(request)
    end

    def post
      request = Net::HTTP::Post.new(@uri.request_uri)
      request.set_form_data(@params)

      send(request)
    end

    def delete
      @uri.query = URI.encode_www_form(@params)
      request = Net::HTTP::Delete.new(@uri.request_uri)

      send(request)
    end

    def send(request)
      # Add all necessary headers
      request["User-Agent"] = "Parsehub ruby gem v#{Parsehub::VERSION}"

      # Setup HTTP connection
      http = Net::HTTP.new(@uri.host, @uri.port)
      http.use_ssl = true

      Parsehub.logger.debug(self) if Parsehub.configuration.debug?

      # Send HTTP request
      http_response = http.request(request)

      # Parse HTTP response
      response = Parsehub::Response.new(http_response)

      Parsehub.logger.debug(response) if Parsehub.configuration.debug?

      response
    end
  end
end
