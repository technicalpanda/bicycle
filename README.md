# bicycle

[![Gem Version](https://badge.fury.io/rb/bicycle.svg)](http://badge.fury.io/rb/bicycle)
[![Build Status](https://travis-ci.org/schinery/bicycle.svg?branch=master)](https://travis-ci.org/schinery/bicycle)

A convenience gem for cycling through a set of values, ported from the ['cycle'](http://api.rubyonrails.org/classes/ActionView/Helpers/TextHelper.html#method-i-cycle) functionality found in Rails. It is independent of which framework you use so will run in Sinatra, Padrino or straight up Ruby itself.

## Installation

```
gem install bicycle
```

In a Gemfile:

```ruby
gem 'bicycle'
```

## Usage

Add the following to your app.rb file:

```ruby
include Bicycle
```

To use, call the cycle function with a set of values you wish to cycle through.

```erb
<%= cycle("odd", "even") %>
```

For example:

```erb
<% @items.each do |item| %>
  <tr class="<%= cycle("odd", "even") %>">
    <td>item</td>
  </tr>
<% end %>
```

If you want to call multiple instances of the cycle function, you can by specifying a name attribute, like so: '

```erb
<%= cycle("red", "green", "blue", :name => "colours") %>
```

You can also reset a given cycle by calling:

```erb
<% reset_cycle("colours") %>
```

For example:

```erb
<% @items.each do |item| %>
  <tr class="<%= cycle("odd", "even", :name => "row_class") -%>">
    <td>
      <% item.values.each do |value| %>
        <%# Create a named cycle "colors" %>
        <span style="color:<%= cycle("red", "green", "blue", :name => "colors") -%>">
        <%= value %>
        </span>
      <% end %>
      <% reset_cycle("colors") %>
    </td>
  </tr>
<% end %>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/schinery/bicycle. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the `Bicycle` project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/schinery/bicycle/blob/master/CODE_OF_CONDUCT.md).
