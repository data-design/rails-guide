---
title: Visual Style Guide
description: Making code beautiful in Ruby
publish: true
---

## Space characters

Ruby basically lets you do what you feel like with white space.


### White space

#### Preferred style

- As in English, put white space after __commas__, such as those in argument lists:

~~~ruby
  def foo(x, y, z)
    "foo"
  end
~~~
^

- Use white space around __operators__:

~~~ruby
  x = 9 + 5
~~~
^




### New lines


### Indentation

- Two spaces per tab character
- No __hard__ tab characters
- 



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

As per the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide#syntax), omit parantheses in these situations:

* Method calls _with no arguments_:

~~~ruby
  # BAD
  "hey".upcase()

  # GOOD
  "hey".upcase
~~~

^

* Conditions for control flow
~~~ruby
  # BAD
  if(x == 2)
    puts 'hey'
  end

  # GOOD
  if x == 2
    puts 'hey'
  end
~~~


#### Abusive style

When omitting parentheses causes pain:

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




