module Parsehub
  class Configuration

    attr_accessor :api_key
    attr_reader   :host

    def initialize
      @api_key = nil
      @host    = ["https://www.parsehub.com/api/v", Parsehub::API_VERSION].join
      @debug   = false
    end

    def debug?
      @debug == true
    end
  end
end
