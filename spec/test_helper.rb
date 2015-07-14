require "minitest/autorun"
require "webmock/minitest"
require 'vcr'
require 'parsehub'
require 'json'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures'
  c.hook_into :webmock
end
