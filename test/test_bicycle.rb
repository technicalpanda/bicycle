require 'helper'

describe "When cycling" do
	before do
		@value1 = Bicycle.cycle("Foo", "Bar", "Huh?")
		@value2 = Bicycle.cycle("Foo", "Bar", "Huh?")
		@value3 = Bicycle.cycle("Foo", "Bar", "Huh?")
		@value4 = Bicycle.cycle("Foo", "Bar", "Huh?")
	end

	it "should return a value in the cycle order" do
		assert_equal "Foo", @value1
		assert_equal "Bar", @value2
		assert_equal "Huh?", @value3
		assert_equal "Foo", @value4
	end
end