# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bicycle/version"

Gem::Specification.new do |spec|
  spec.name = "bicycle"
  spec.version = Bicycle::VERSION
  spec.authors = ["Stuart Chinery"]
  spec.description = "A convenience gem for cycling through a set of values, ported from the 'cycle' " \
                     "functionality found in Rails. It is independent of which framework you use so " \
                     "will run in Sinatra, Padrino or straight up Ruby itself."
  spec.email = ["stuart.chinery@gmail.com"]
  spec.files = Dir["lib/**/*", "MIT-LICENSE", "Rakefile", "README.md", "VERSION"]
  spec.homepage = "https://github.com/schinery/bicycle"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.5"
  spec.summary = "A convenience gem for cycling through a set of values"

  spec.add_development_dependency "byebug", "~> 11.1"
  spec.add_development_dependency "minitest", "~> 5.14"
  spec.add_development_dependency "minitest-fail-fast", "~> 0.1"
  spec.add_development_dependency "minitest-macos-notification", "~> 0.3"
  spec.add_development_dependency "minitest-reporters", "~> 1.4"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rubocop", "~> 1.7"
  spec.add_development_dependency "rubocop-minitest", "~> 0.10"
  spec.add_development_dependency "rubocop-rake", "~> 0.5"
end
