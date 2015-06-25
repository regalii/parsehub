require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |test|
  test.libs << 'lib' << 'spec'
  test.pattern = 'spec/**/*_spec.rb'
  test.verbose = true
end

desc "Run tests"
task :default => :test
