---
title: Overview to Rails Model-View-Controller Convention
description: An overview of how all the Rails magic ties together before we get into the details.
---



when you run:

    rails g scaffold Book


Rails will create a host of new files:


$ rails g model Book
      invoke  active_record
      create    db/migrate/20140303194714_create_books.rb
      create    app/models/book.rb


$ rails g controller Books show index

      create  app/controllers/books_controller.rb
       route  get "books/index"
       route  get "books/show"
      invoke  erb
      create    app/views/books
      create    app/views/books/show.html.erb
      create    app/views/books/index.html.erb


# Migration
The first file is a "migration". This is simply a convenience. Your app uses a database, and Rails is giving you a template for configuring that app in ActiveRecord lingo.

# Model
With the database altered, your Rails app now has a Book class, which you can start adding data to:

Think of ActiveRecord as the Ruby interface for creating and finding things in your database. Instead of writing SQL, you write this:


# Router

So we've confirmed that our Rails app talks to the database...but we're not making a database app, we're making a web app. How does a user, with a web browser, get to peruse our books? This job falls to the Rails router and ActionController.

First, the router:

       route  get "books/index"
       route  get "books/show"


# Controller

      create  app/controllers/books_controller.rb



With the Rails controller, 

# View

The `rails g controller` command actually sets up the View files, as Rails convention assumes 


## View helpers

books_path(Book.first[1])



# Why convention?

For newcomers to Rails, especially for those new to programming, period,  this magic can be the source of a lot of confusion. Because they can't understand that "books_path" is a Rails-meta-magically generated method dependent on other things. 

So they'll do something like, "I want a Magazine", create a "MagazineController" (but not the model), and not realize that Magazine.create does not exist, nor will magazines/ go to a listing of magazines.


But if you're a relatively experienced programmer (and it took me awhile to get at this), Rails' magic is not magic, but just well-thought out conventions that, at anytime, I can break as needed.

This is a frustrating situation. The only thing I can tell you is to BREAK SHIT, frequently and often (and on your own time). Until you understand how to make books_path not go to /books/ (And then how to fix it), Rails will always be a baffling mystery.


On the other hand, if you're a framework veteran, after you get familiar with the conventions, you'll appreciate the boilerplate dullness that Rails saves you from. The rest of this guide is going to follow convention and will only break it with purpose.





