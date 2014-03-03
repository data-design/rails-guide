---
title: Data Design with Ruby and Rails
---


### Congressmember, introduction

~~~ruby

class Congressmember < ActiveRecord::Base

  validates_uniqueness_of :bioguide_id
  

end
~~~



### Congressmember, helper attributes

~~~ruby

class Congressmember < ActiveRecord::Base

  def full_name

  end

  def age

  end
end
~~~



### The Bill


### The Sponsor



### The Cosponsor, has_many sponsors, through



### Congressmember, normalization of terms


### The Term, and has_many, belongs_to




### Inheritance Congressmember, senator, and house



### Tweeters




