# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "bicycle"
  gem.homepage = "http://github.com/sleepingstu/bicycle"
  gem.license = "MIT"
  gem.summary = %Q{Why walk when you can cycle}
  gem.description = %Q{A conveniance gem for cycling through a set of values, much like the 'cycle' functionality found in Rails, but is independant of which framework you use so will run in Sinatra, Padrino or straight up Ruby itself.}
  gem.email = "sleepingstu@gmail.com"
  gem.authors = ["Stuart Chinery"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'yard'
YARD::Rake::YardocTask.new