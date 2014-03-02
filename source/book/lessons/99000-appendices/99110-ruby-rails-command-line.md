---
title: Common commands for Ruby and Rails
description: The many ways to do Ruby things on the shell
references:
  - url: http://guides.rubygems.org/command-reference
    title: Rubygems Command References
---



## Plain Ruby

###### Running a single script:

    ruby hello-world.rb


------------

## Rubygems and bundler

http://bundler.io/

###### List current gems installed

    gem list

###### Installing a single gem

    gem install rake

###### Multiple gems

    gem install rake bundler mysql2

###### Installing a gem by version

    gem install rails -v 3.2.17

###### Using Bundler with a gemfile
This will install all dependencies as specified in the directory's `Gemfile`:

    bundle install

###### Start an interactive Ruby session with the current bundle
This is handy for testing things out with all the dependencies loaded:

    bundle console


## Rake

###### List available `rake` tasks

    rake -T

###### Run a Rake task:

    rake hello:world


## Rails

### Run the Rails app locally

###### Check Rails version

    rails -v

###### Start the server

By default this will start the Rails app at http://127.0.0.1:3000 and in the `development` environment

    rails s

###### Specify __port__ and __environment__

    rails s -e production -p 4567


### Console

###### Start an interactive session in a Rails app

    rails c

###### Specify environment for Rails console

    rails c production

-----------------




### Rails, Rake, and environment

I frequently mess this up. `rake` uses a wholly different flag convention than the `rails` binary. And even within `rails`, you have differences. Try not to mix these up:

###### Start the Rails server in specified environment

    rails s -e my_custom_environment

###### Start Rails console in specified environment

    rails c my_custom_environment

###### Delete the database of a specific Rails environment

    rake db:drop RAILS_ENV=my_custom_environment


---------------

### Rails database work

Even though `rails` is an executable binary, a lot of important operations are executed via __Rake__, including database setup and migration. Again, it can't be stressed enough that the command-line conventions are different between `rails` and `rake`

###### Initializing the database for a new application

    rake db:setup

###### Run database migrations

    rake db:migrate

###### Purge the database and set it up via schema.rb

    rake db:schema:load




## Testing

### Rspec

#### Within Rails

###### Run the entire suite
###### Run a single file
###### Run a single test
###### Run all specs with specified text in their description




