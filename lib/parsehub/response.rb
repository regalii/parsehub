module Parsehub
  class Response
    attr_reader :success
    attr_reader :data

    def initialize(http_response)
      @success = http_response.kind_of?(Net::HTTPSuccess)
      @data = begin
                JSON::parse(http_response.body)
              rescue
                {message: 'Server returned a non-json error'}
              end if http_response
              
      @data.merge!(raw: http_response.body.inspect)
    end

    def success?
      success
    end
  end
end
