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

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
require "bicycle"
require "dummy_app"

require "minitest/autorun"
require "minitest/fail_fast"
require "minitest/macos_notification"
require "minitest/reporters"
require "minitest/spec"

module Minitest
  class Test
    extend Minitest::Spec::DSL
  end
end

Minitest::Reporters.use!(
  [
    Minitest::Reporters::SpecReporter.new,
    Minitest::Reporters::MacosNotificationReporter.new(title: "Bicycle Gem")
  ],
  ENV,
  Minitest.backtrace_filter
)
