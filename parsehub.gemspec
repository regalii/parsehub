# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parsehub/version'

Gem::Specification.new do |spec|
  spec.name          = "parsehub"
  spec.version       = Parsehub::VERSION
  spec.authors       = ["Hesham El-Nahhas"]
  spec.email         = ["hello@hesham.ca"]
  spec.summary       = %q{Unofficial parsehub ruby client}
  spec.description   = %q{Unofficial parsehub ruby client}
  spec.homepage      = "https://www.parsehub.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",  "~> 1.7"
  spec.add_development_dependency "rake",     "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.7.0"
  spec.add_development_dependency "vcr",      "~> 2.9.3"
  spec.add_development_dependency "webmock",  "~> 1.21.0"

  spec.add_dependency 'json'
end
