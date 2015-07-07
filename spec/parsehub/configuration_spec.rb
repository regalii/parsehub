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

  it "default debug to false" do
    Parsehub.configuration.debug.must_equal(false)
  end

  it "sets debug option" do
    Parsehub.configure do |config|
      config.debug = true
    end

    Parsehub.configuration.debug.must_equal true
  end
end
