---
title: Syntax-Sugar Style Guide
description: Sweet Ruby without the tooth decay
publish: true

---

## Alternatives to `initialize`

Ruby's common data objects can be initialized through the `new`

Nearly all of Ruby's main data classes have shorthand ways of instantiation:

#### String

~~~ruby
s = String.new("hey")
s = 'hey'
~~~


#### Array

~~~ruby
a = Array.new()
a = []
a = Array.new([1,2,3])
a = Array([1,2,3])
~~~

The `Array.new` method can optionally take in 2 arguments:

~~~ruby
Array.new(3)
# => [nil, nil, nil]

Array.new(3, 'a')
# => ['a', 'a', 'a']
~~~

## Blocks

~~~ruby
open("path/to/file.txt") do |f|
    

end
~~~


~~~ruby

~~~


~~~ruby

~~~


## Loops

Basically, never use `for`


## Control flow

### `if` versus `unless`

~~~ruby

~~~

~~~ruby

~~~

~~~ruby

~~~


#### Don't use "safe assignments" for `if` conditions

I love doing this, because it seems so clever and elegant, and it saves me from typing an extra line:

~~~ruby
if x = array.pop
  y = x.to_f / 100
  
  return x.round
end
~~~

Problem is, every time the debugger tells me there's an error near this code, my eyes _always_ snap to this non-boolean statement and I think, "Aha! Some moron forgot that double equals sign is used to test truthiness." And, I'm ashamed to admit, I'll often forget that idiot was _me_, change the conditional statement, which will then _really_ make for some fun runtime errors.

The time it takes to detangle that mess is much, _much_ more time than it takes to just write this from the beginning:


~~~ruby
x = array.pop
unless x.nil?
  y = x.to_f / 100
  
  return x.round
end
~~~



