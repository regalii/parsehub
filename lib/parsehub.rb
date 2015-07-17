require 'logger'

require "parsehub/version"
require "parsehub/configuration"
require "parsehub/request"
require "parsehub/response"
require "parsehub/project"
require "parsehub/run"
require "parsehub/logger"

module Parsehub
  class Error < StandardError ; end

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.logger
    @logger ||= Parsehub::Logger.new(STOUT)
  end
end
