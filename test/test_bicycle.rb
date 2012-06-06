require 'helper'
include Bicycle

describe "When cycling" do
	describe "with values" do
		before do
			@values = []
			for i in (0..3)
				@values[i] = cycle("Foo", "Bar", "Huh?")
			end
		end

		it "should return a value in the cycle order" do
			assert_equal "Foo", @values[0]
			assert_equal "Bar", @values[1]
			assert_equal "Huh?", @values[2]
			assert_equal "Foo", @values[3]
		end

		describe "and with new values" do
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

	describe "with multiple instances in one loop" do
		before do
			@values = []
			@sub_values = []
			for i in (0..3)
				@values[i] = cycle("Foo", "Bar", "Huh?")

				value = []
				for j in (0..5)
					value[j] = cycle("I", "just", "want", "to", "ride", :name => "bikes")
				end
				@sub_values[i] = value

				reset_cycle("bikes")
			end
		end

		it "should return a value from the first cycle order" do
			assert_equal "Foo", @values[0]
			assert_equal "Bar", @values[1]
			assert_equal "Huh?", @values[2]
			assert_equal "Foo", @values[3]
		end

		it "should return a value from the first bike cycle order" do
			assert_equal "I", @sub_values[0][0]
			assert_equal "just", @sub_values[0][1]
			assert_equal "want", @sub_values[0][2]
			assert_equal "to", @sub_values[0][3]
			assert_equal "ride", @sub_values[0][4]
			assert_equal "I", @sub_values[0][0]
		end

		it "should return a value from the second bike cycle order" do
			assert_equal "I", @sub_values[1][0]
			assert_equal "just", @sub_values[1][1]
			assert_equal "want", @sub_values[1][2]
			assert_equal "to", @sub_values[1][3]
			assert_equal "ride", @sub_values[1][4]
			assert_equal "I", @sub_values[1][0]
		end

		it "should return a value from the third bike cycle order" do
			assert_equal "I", @sub_values[2][0]
			assert_equal "just", @sub_values[2][1]
			assert_equal "want", @sub_values[2][2]
			assert_equal "to", @sub_values[2][3]
			assert_equal "ride", @sub_values[2][4]
			assert_equal "I", @sub_values[2][0]
		end
	end

	describe "finding its current cycle" do
		before do
			@values = []
			@current = []
			for i in (0..5)
				@values[i] = cycle("I", "just", "want", "to", "ride")
				@current[i] = current_cycle
			end
		end

		it "should match whats cycled" do
			for i in (0..5)
				assert_equal @values[i], @current[i]
			end
		end
	end
end