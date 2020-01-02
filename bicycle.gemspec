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
  spec.homepage = "https://github.com/schinery/bicycle"
  spec.license = "MIT"
  spec.summary = "A convenience gem for cycling through a set of values"
  spec.files = Dir["lib/**/*", "MIT-LICENSE", "Rakefile", "README.md", "VERSION"]

  spec.add_development_dependency "rake", "~> 13.0"
end
