require 'helper'
include Bicycle

describe "When cycling" do
	before do
		@values = []
		for i in (0..3)
			@values[i] = cycle("Foo", "Bar", "Huh?", :name => "foos")
		end
	end

	it "should return a value in the cycle order" do
		assert_equal "Foo", @values[0]
		assert_equal "Bar", @values[1]
		assert_equal "Huh?", @values[2]
		assert_equal "Foo", @values[3]
	end

	describe "with new values" do
		before do
			@values = []
			for i in (0..5)
				@values[i] = cycle("I", "just", "want", "to", "ride", :name => "bikes")
			end
		end

		it "should return a new value in the cycle order" do
			assert_equal "I", @values[0]
			assert_equal "just", @values[1]
			assert_equal "want", @values[2]
			assert_equal "to", @values[3]
			assert_equal "ride", @values[4]
			assert_equal "I", @values[0]
		end
	end
end