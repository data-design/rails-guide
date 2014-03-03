---
title: Mixins
description: Adding common behavior to Ruby models
---


Ruby lacks multiple inheritance, but you can get most of the benefits through __mixins__:


~~~ruby
class Movie
  include Comparable
  attr_reader :title, :rating

  def <=>(movie)
    self.rating <=> movie.rating
  end

  def initialize(title, rating)
    @title = title
    @rating = rating.to_f
  end
end

~~~


~~~ruby


~~~

### Monkeypatching Array

Note: You do not actually want to alter the Array class in such a drastic (and useless) fashion.

~~~ruby
class Array
  include Comaprable
  def <=>(arr)
    self.to_s <=> arr.to_s
  end
end
~~~

Now you can:

~~~ruby
[5,6,7] > [1,2,3,4]
# true, because '567' > '1234'

~~~

