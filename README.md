bicycle
=======

A convenience gem for cycling through a set of values, ported from the ['cycle'](http://api.rubyonrails.org/classes/ActionView/Helpers/TextHelper.html#method-i-cycle) functionality found in Rails. It is independent of which framework you use so will run in Sinatra, Padrino or straight up Ruby itself.

Installation:
-------------

```
gem install bicycle
```

In a Gemfile:

```ruby
gem 'bicycle'
```

Usage
-----

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

Contributing to bicycle
-----------------------

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2012 Stuart Chinery. See LICENSE.txt for
further details.

