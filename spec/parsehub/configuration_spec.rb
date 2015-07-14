require 'test_helper'

describe Parsehub::Configuration do

  it "sets api_key" do
    Parsehub.configure do |config|
      config.api_key = 'test-api-key'
    end

    Parsehub.configuration.api_key.must_equal 'test-api-key'
  end

  it "sets default api url" do
    Parsehub.configuration.host.must_equal("https://www.parsehub.com/api/v2")
  end

  it "sets custom logger" do
    class AwesomeLogger < Parsehub::Logger
    end

    Parsehub.configure do |config|
      config.logger = AwesomeLogger.new(STDOUT)
    end

    Parsehub.configuration.logger.must_be_kind_of(AwesomeLogger)
    Parsehub.configuration.logger?.must_equal(true)
  end
end
