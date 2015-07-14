module Parsehub
  class Configuration

    attr_accessor :api_key, :logger
    attr_reader   :host

    def initialize
      @api_key = nil
      @host    = ["https://www.parsehub.com/api/v", Parsehub::API_VERSION].join
      @logger  ||= Parsehub::Logger.new(STDOUT)
    end

    def logger?
      logger.is_a?(Logger)
    end
  end
end
