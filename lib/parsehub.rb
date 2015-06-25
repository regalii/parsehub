require "parsehub/version"
require "parsehub/configuration"
require "parsehub/request"
require "parsehub/response"
require "parsehub/project"
require "parsehub/run"

module Parsehub
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
