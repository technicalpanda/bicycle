require 'helper'

describe "When cycling" do
	before do
		@values = []
		for i in (0..3)
			@values[i] = Bicycle.cycle("Foo", "Bar", "Huh?")
		end
	end

	it "should return a value in the cycle order" do
		assert_equal "Foo", @values[0]
		assert_equal "Bar", @values[1]
		assert_equal "Huh?", @values[2]
		assert_equal "Foo", @values[3]
	end
end