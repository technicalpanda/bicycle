# frozen_string_literal: true

require "rubygems"
require "bundler"
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  warn e.message
  warn "Run `bundle install` to install missing gems"
  exit e.status_code
end
require "rake"

require "jeweler"
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "bicycle"
  gem.homepage = "http://github.com/schinery/bicycle"
  gem.license = "MIT"
  gem.summary = %(Why walk when you can cycle)
  gem.description = %(A convenience gem for cycling through a set of values, ported from the 'cycle' functionality found in Rails. It is independent of which framework you use so will run in Sinatra, Padrino or straight up Ruby itself.)
  gem.email = "stuart.chinery@gmail.com"
  gem.authors = ["Stuart Chinery", "Dave Hrycyszyn"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require "rake/testtask"
Rake::TestTask.new(:test) do |test|
  test.libs << "lib" << "test"
  test.pattern = "test/**/*_test.rb"
  test.verbose = true
end

task default: :test

require "yard"
YARD::Rake::YardocTask.new
