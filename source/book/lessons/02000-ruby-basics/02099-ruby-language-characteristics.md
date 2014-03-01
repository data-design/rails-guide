---
title: Ruby for the Journeyman
description: Important things to know for first-time Ruby programmers
references:
    - url: https://www.ruby-lang.org/en/documentation/ruby-from-other-languages/to-ruby-from-php/
      title: From Ruby to PHP
---

This is a short list of all the must-knows about basic Ruby programming, for anyone coming from another language.


### Semi-colons are unnecessary at the end of a line

Unless the last character is a comma, or there is an unclosed structure (a quotation mark, left-parentheses, etc.), a line of code is considered to be "done" at the end of the line, and no semi-colon is needed:

    TK

### Implied return values

If there is no `return` statement, Ruby functions/methods will, by default, return the value of the last executed line.

This is probably the single thing I screw up the most when switching between Ruby and JavaScript in the same project (and almost reason enough to switch to CoffeeScript).

Example:

    TK


### Variables are not declared


### Parentheses are optional

### Curly braces are (often) optional

### Conditionals are terminated with `end`

One consequence of optional-curly-braces is that `if`/`while`

### Conditionals can be inline


### `if` and `while` have negative English counterparts

- `if` and `unless`
- `while` and `until`


### Null values are designated as `nil` and are falsey

~~~ruby
world = nil
puts "Hello" if !(world)
# => Hello
~~~

### Empty values are truthy

~~~ruby
str = ""
puts str.nil?
#=> false

if str
  puts "It exists!"
end
# => It exists!    
~~~

### No multiple inheritance

Subclasses can adopt different sets of behavior from including different __mixins__ but they can only have one direct parent:

~~~ruby
class Animal
  def organism?
    true
  end
end

module MenuItem
  def yummy?
    true
  end
end

class Chicken < Animal
  include MenuItem
end
~~~



### Hashes are ordered
As of Ruby 1.9, a Hash will maintain its order:

### Method names can end with `?` or a `!`

Ruby method names can *end* with a __question mark__ or __exclamation mark__. This convention exists with the recommendation that *questioning* method names always return `true` or `false`.

 and more importantly, these punctuation marks have __no explicit bearing on what the method does__:






### `for` loops are not normal


### Symbols are not strings

    TK


### Arguments are passed by reference

Pass by value.



See: http://stackoverflow.com/a/10974116/160863



### Everything is an object

Obviously, this is a very important feature of Ruby, but I saved it for last because it's not something that directly impacts how your first fumbling attempts to read and write Ruby. However, one direct implication is that, at any point which you are confused about what you're dealing with, you can always invoke the object's `class` method:

~~~ruby
[1].class
# => Array



~~~