---
title: Quick and Sweet Guide to Ruby Sugar
description: Fun Ruby syntax
---



## Punctuation


### Parentheses are optional

~~~ruby
(1 / 3.0).round(3) # => 0.333

(1 / 3.0).round 3  # => 0.333
~~~

Note that parentheses are still needed to maintain __order of operations__. This, for example, will throw an error:

~~~ruby
1 / 3.0.round 3   # => SyntaxError: unexpected tINTEGER, expecting $end
~~~

And this will get you a completely different answer:

~~~ruby
1 / 3.0.round(3)  # => 0.3333333333333333
~~~


#### Preferred style

As per the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide#syntax)

* Omit parentheses for method calls _with no arguments_:

~~~ruby
  "hey".upcase()  # =>  HEY
  "hey".upcase
~~~

^

* Omit


#### Abusive style

- Omitting parentheses in method definitions:

~~~ruby

  # BAD
  def embiggen a_string
    a_string.upcase
  end

  # GOOD
  def embiggen(a_string)
    a_string.upcase
  end
~~~


- Killing readability:

~~~ruby
  # bad
~~~


#### Common Rails usage

With parentheses: 

~~~erb
<ul>
  <% items.each do |item| %>
    <li><%= link_to(item.name, item.url, :target => '_blank') %></li>
  <% end %>
</ul>
~~~

Without:

~~~erb
<ul>
  <% items.each do |item| %>
    <li><%= link_to item.name, item.url, :target => '_blank' %><li>
  <% end %>
</ul>
~~~


----------

### Hash braces are optional in arguments

~~~ruby

def foo(str, opts={})
  # ...
end

# with:
foo str, {:upcase => true, :allow_nil => true}

# without:
foo str, :upcase => true, :allow_nil => true
~~~


#### Common Rails Usage


~~~ruby
# with:
User.create({ :name => 'Bob', :age => 12 })

# without:
User.create( :name => 'Bob', :age => 12 )
~~~




