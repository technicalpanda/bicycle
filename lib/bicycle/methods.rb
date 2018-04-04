# frozen_string_literal: true

module Bicycle
  module Methods
    # Creates a Cycle object whose _to_s_ method cycles through elements of an
    # array every time it is called. This can be used for example, to alternate
    # classes for table rows. You can use named cycles to allow nesting in loops.
    # Passing a Hash as the last parameter with a <tt>:name</tt> key will create a
    # named cycle. The default name for a cycle without a +:name+ key is
    # <tt>"default"</tt>. You can manually reset a cycle by calling reset_cycle
    # and passing the name of the cycle. The current cycle string can be obtained
    # anytime using the current_cycle method.
    #
    def cycle(*values)
      if values.last.instance_of? Hash
        params = values.pop
        name = params[:name]
      else
        name = "default"
      end

      cycle = get_cycle(name)
      cycle = set_cycle(name, Cycle.new(values)) unless cycle && cycle.values == values
      cycle.to_s
    end

    # Returns the current cycle string after a cycle has been started. Useful
    # for complex table highlighting or any other design need which requires
    # the current cycle string in more than one place.
    #
    def current_cycle(name = "default")
      cycle = get_cycle(name)
      cycle&.current_value
    end

    # Resets a cycle so that it starts from the first element the next time
    # it is called. Pass in +name+ to reset a named cycle.
    #
    def reset_cycle(name = "default")
      cycle = get_cycle(name)
      cycle&.reset
    end

    class Cycle #:nodoc:
      attr_reader :values

      def initialize(values)
        @values = values
        reset
      end

      def reset
        @index = 0
      end

      def current_value
        @values[previous_index].to_s
      end

      def to_s
        value = @values[@index].to_s
        @index = next_index
        value
      end

      private

      def next_index
        step_index(1)
      end

      def previous_index
        step_index(-1)
      end

      def step_index(num)
        (@index + num) % @values.size
      end
    end

    private

    # The cycle helpers need to store the cycles in a place that is
    # guaranteed to be reset every time a page is rendered, so it
    # uses an instance variable of ActionView::Base.
    def get_cycle(name)
      @_cycles = {} unless defined?(@_cycles)
      @_cycles[name]
    end

    def set_cycle(name, cycle_object)
      @_cycles = {} unless defined?(@_cycles)
      @_cycles[name] = cycle_object
    end
  end
end
