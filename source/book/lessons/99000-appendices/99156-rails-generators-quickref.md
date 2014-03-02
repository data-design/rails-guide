---
title: Rails generators cheat sheet
description: How to quickly scaffold an application 
---

### Setup a Rails application

###### Create a new project skeleton

    rails new myproject

###### Create a new project with Postgres

    rails new myproj -d postgresql

###### Create a new project with specific Rails version

    rails _3.2.17_ new myproj


### Using Rails generators

###### Create a new model

    rails g model Person

Either `person` or `Person` will work. This will generate these files with the proper naming conventions:

      invoke  active_record
      create    db/migrate/20140302162053_create_people.rb
      create    app/models/person.rb
      invoke    test_unit
      create      test/unit/person_test.rb
      create      test/fixtures/people.yml


###### Create a new model with fields

    rails g model Person name:string birthdate:date

This will add table configuration to the migration:

~~~ruby
    create_table :people do |t|
      t.string :name
      t.date :birthdate

      t.timestamps
    end
~~~


###### Create a new controller
  
    rails g controller people

Ouput:

      create  app/controllers/person_controller.rb
      invoke  erb
      create    app/views/person
      invoke  test_unit
      create    test/functional/person_controller_test.rb
      invoke  helper
      create    app/helpers/person_helper.rb
      invoke    test_unit
      create      test/unit/helpers/person_helper_test.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/person.js.coffee
      invoke    scss
      create      app/assets/stylesheets/person.css.scss

Note: If you intend to create a controller for the `Person` model, it's up to you to follow the convention of plural in the controller name. Rails will generate `person_controller` if you do: `rails g controller person`

###### Scaffold a model

To have Rails generate everything for you, including the boilerplate definition and support files, with the proper conventions:

    rails g scaffold person name:string birthday:date

      invoke  active_record
      create    db/migrate/20140302163142_create_people.rb
      create    app/models/person.rb
      invoke    test_unit
      create      test/unit/person_test.rb
      create      test/fixtures/people.yml
      invoke  resource_route
       route    resources :people
      invoke  scaffold_controller
      create    app/controllers/people_controller.rb
      invoke    erb
      create      app/views/people
      create      app/views/people/index.html.erb
      create      app/views/people/edit.html.erb
      create      app/views/people/show.html.erb
      create      app/views/people/new.html.erb
      create      app/views/people/_form.html.erb
      invoke    test_unit
      create      test/functional/people_controller_test.rb
      invoke    helper
      create      app/helpers/people_helper.rb
      invoke      test_unit
      create        test/unit/helpers/people_helper_test.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/people.js.coffee
      invoke    scss
      create      app/assets/stylesheets/people.css.scss
      invoke  scss
   identical    app/assets/stylesheets/scaffolds.css.scss

    

###### Delete default generated files

    rails d model person

Handy for when you've made a mistake when running the generator:

      invoke  active_record
      remove    db/migrate/20140302162053_create_people.rb
      remove    app/models/person.rb
      invoke    test_unit
      remove      test/unit/person_test.rb
      remove      test/fixtures/people.yml

You can also destroy an entire scaffold:

    rails d scaffold person

