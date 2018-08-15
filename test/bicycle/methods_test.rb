# frozen_string_literal: true

require "helper"
require "dummy_app"

module Bicycle
  class MethodsTest < Minitest::Test
    let(:app) { DummyApp.new }
    let(:values) { [] }

    describe Bicycle::Methods do
      describe "#cycle" do
        describe "with values" do
          before do
            (0..3).each do |idx|
              values[idx] = app.cycle("Foo", "Bar", "Huh?")
            end
          end

          it "should return a value in the cycle order" do
            assert_equal "Foo", values[0]
            assert_equal "Bar", values[1]
            assert_equal "Huh?", values[2]
            assert_equal "Foo", values[3]
          end

          describe "and with new values" do
            before do
              (0..5).each do |idx|
                values[idx] = app.cycle("I", "just", "want", "to", "ride", name: "bikes")
              end
            end

            it "should return a new value in the cycle order" do
              assert_equal "I", values[0]
              assert_equal "just", values[1]
              assert_equal "want", values[2]
              assert_equal "to", values[3]
              assert_equal "ride", values[4]
              assert_equal "I", values[0]
            end
          end
        end

        describe "with multiple instances in one loop" do
          let(:sub_values) { [] }

          before do
            (0..3).each do |idx|
              values[idx] = app.cycle("Foo", "Bar", "Huh?")
              other_values = []

              (0..5).each do |second_idx|
                other_values[second_idx] = app.cycle("I", "just", "want", "to", "ride", name: "bikes")
              end

              sub_values[idx] = other_values
              app.reset_cycle("bikes")
            end
          end

          it "should return a value from the first cycle order" do
            assert_equal "Foo", values[0]
            assert_equal "Bar", values[1]
            assert_equal "Huh?", values[2]
            assert_equal "Foo", values[3]
          end

          it "should return a value from the first bike cycle order" do
            assert_equal "I", sub_values[0][0]
            assert_equal "just", sub_values[0][1]
            assert_equal "want", sub_values[0][2]
            assert_equal "to", sub_values[0][3]
            assert_equal "ride", sub_values[0][4]
            assert_equal "I", sub_values[0][0]
          end

          it "should return a value from the second bike cycle order" do
            assert_equal "I", sub_values[1][0]
            assert_equal "just", sub_values[1][1]
            assert_equal "want", sub_values[1][2]
            assert_equal "to", sub_values[1][3]
            assert_equal "ride", sub_values[1][4]
            assert_equal "I", sub_values[1][0]
          end

          it "should return a value from the third bike cycle order" do
            assert_equal "I", sub_values[2][0]
            assert_equal "just", sub_values[2][1]
            assert_equal "want", sub_values[2][2]
            assert_equal "to", sub_values[2][3]
            assert_equal "ride", sub_values[2][4]
            assert_equal "I", sub_values[2][0]
          end
        end
      end

      describe "#current_cycle" do
        let(:current_cycle) { [] }

        before do
          (0..5).each do |idx|
            values[idx] = app.cycle("I", "just", "want", "to", "ride")
            current_cycle[idx] = app.current_cycle
          end
        end

        it "should match whats cycled" do
          (0..5).each do |idx|
            assert_equal values[idx], current_cycle[idx]
          end
        end
      end
    end
  end
end
