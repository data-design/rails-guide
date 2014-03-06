---
title: Rails Controllers at a glance
description: 'The "C" in MVC'
references:
    - title: Ruby on Rails Guide's Action Controller Overview
      url: http://guides.rubyonrails.org/action_controller_overview.html
---

Pretend a user is visiting __ExampleLibrary__, a built-on-Rails app, at this address: 

    http://example-library.com/books/2073

Even without knowing Rails in detail, you can guess the intent: ExampleLibrary has a collection of __books__ and this address points to the webpage for Book __#2073__.

You can also guess what happens in the previous directory level:

    http://example-library.com/books

This page might be the "overview" for the books collection, anything from an attractive catalog full of book covers that link to `/books/BOOK_ID` paths, or just a simple list of titles and links.

So how does the ExampleLibrary Rails app know what to _do_ at `/books/` versus `/books/98`, that is, to serve up a collection of books and a single book, respectively?

This is the work of the Rails controller.


## The Action Controller naming convention

From the previous chapter, you can assume that ExampleLibrary has `books` table in its database, which corresponds to an ActiveRecord model named `Book`. Likewise, the Rails convention is for a controller named `BooksController` (note the plural), stored in the project directory at `app/controllers/books_controller.rb`


To deal with the `/books` and `/books/780` paths, the code for `BooksController` might looks like this:

~~~ruby
class BrandsController < ApplicationController
  def index
  # for /books
  end

  def show
  # for /books/:id
  end
end
~~~


### The `index` action

It's important to re-emphasize again that we're talking about __default__ Rails convention. If we want, we could configure the `BrandController` to use the `index` action for paths that look like: `/books/list/all`. 

But by default, Rails assumes that if you have a resource named `Book`, then `/books` is where you'd want to place an `index` of those data resources &ndash; and in general, this is a pretty good assumption.

This is what an `index` action usually looks like:

~~~ruby
  def index
    @books = Book.all
  end
~~~


...and, that's it. Now, as your app matures and changes from its original vision, your `index`-type actions might contain additional conditional and filtering logic. For example, you might want the list of books to be ordered chronologically. Or, if your database contains pre-publication data, then you might have a filter to show only `published` books. And if your Rails app maintains a customer list, you may show different books to `registered` users:

~~~ruby
  def index
    list_size = current_user.registered? ? 100 : 10

    @books = Book.where(published: true).order('publish_date DESC').limit(list_size)
  end
~~~

The key lesson here is that this basic conditional filtering and logic is done _before_ we start rendering the content of the webpage. Whoever's job is to _design_ the webpage layout should not have to worry about whether the `@books` variable contains published or non-published books, or even what order they'll appear. And anyone who wants to later _change_ the order or type of books listed in `index` knows exactly where to go: `books_controller.rb`




### The `show` action

This action is a little more involved than `index`: it has to be, because its intent is to get the data for a specific book:

~~~ruby
  def show
    @book = Book.find(params[:id])
  end
~~~


The Rails controller has access to a `Hash` object named `params` which contains a key-value pair for `:id`. So when a user visits this address:

    http://example-library.com/books/56

The `params` hash will look like this:

    { id: 56 }

How does `params` get created, and how does it know that `id` should refer to `56`? Again, more Rails convention, though [on the part of the router](/lessons/rails-router), which we'll cover later.



