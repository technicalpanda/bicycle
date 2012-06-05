module Bicycle

  # Function to return a single value from an array of 
  # given values that you want to cycle through.
  # @param [Array] values to cycle through
  # @return [?] one of the values in a given order
  def self.cycle(*to_cycle)
    return to_cycle[@_cycle = ((@_cycle || -1) + 1) % to_cycle.count]
  end

end