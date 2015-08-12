module Parsehub
  class Response
    attr_reader :success
    attr_reader :data

    def initialize(http_response)
      @success = http_response.kind_of?(Net::HTTPSuccess)
      @data = begin
                JSON::parse(http_response.body)
              rescue JSON::JSONError
                {message: 'Error parsing response to JSON'}
              end if http_response

      @data.merge!(raw: http_response.body.inspect) if Parsehub.configuration.debug?
    end

    def success?
      success
    end
  end
end
