---
title: Installing Ruby and Rails
description: A high-level overview of Ruby and Rails installation
publish: true
---

Getting Ruby on Rails to work on your computer may likely be the most frustrating experience you'll have with Rails (at least before you start _deploying_ Rails apps). There's no quick fix for it: Rails is liked because it _does a lot of things_, which means lots of _dependencies_, which means lots of opportunities for things to go wrong.

Multiply the number of those Ruby-*and*-Rails-specific "opportunities" with all the different ways that your own computer is its own special snowflake (i.e. type of operating system, version of operating system, versions of every library and program currently installed on your system, etc.) and you can see where things might go off-kilter.

So consider Rails installation as your first trial in devops and debugging. If you _are_ contemplating building a complex web application, you're going to have to get some skill (and intestinal fortitude) for it anyway.


## Scope of this guide

Dev ops is not my specialty, to say the least. So I won't even attempt to be comprehensive here. In fact, I'm going to go the path of least resistance: how to install Ruby and Rails on a new Mac OS X system (10.8 Mountain Lion to 10.9 Mavericks). This is so I can focus on the high-level explanation of what's going on and, more selfishly, because that's my and my coworkers' current situations.

__The presumtpive end game:__ To setup your system to run multiple versions of Ruby (if needed) with multiple versions of Rails with MySQL. Obviously you can choose your own database but the steps will be similar in nature to installing MySQL.

Mac OS X comes pre-installed with Ruby, which we'll refer to as the __system Ruby__ but it's best to leave that alone and untouched. This installation process will create a _separate_ and more flexible environment for our Ruby work. A nice benefit of this is you won't have to `sudo` around to install and change things.

## OS X system setup

This following section is very specific to Mac OS X and are not related to Ruby _specifically_. If you're on Linux, for example, you'd be using `apt-get` to install packages.

### Homebrew

Homebrew is the latest and greatest in OS X package management. For a wide variety of software libraries, installation of the Python language, git version control, and the Imagemagick graphics library &ndash; all at once &ndash; is as simple as:

    brew install git imagemagick python


But to do that, we have to install Homebrew first.

#### Install XCode tools

Homebrew requires the XCode command line tools TK

#### Common Homebrew commands

- `brew doctor` - Before you decide to do anything, such as install something through homebrew, this command will tell you if everything is currently working. Run it *all* the time.
- `brew update` - The `brew doctor` command, if nothing else, will gently remind you to run `update` to get the latest "formulas" for the installation of software. These can change often so it's a good habit to get into.
- `brew install FORMULA_NAME` - Replace 'FORMULA_NAME' with some library you actually want to install
- `brew list` - Use this to remember if you've actually installed something
- `brew uninstall FORMULA_NAME` - Use this to remove libraries you aren't using. I frequently use it to remove _broken_ libraries before reinstalling them again.



### rbenv

Now that Homebrew's installed, you might think the next step is to run:

    brew install ruby

Not that that _won't_ work. But in a typical Ruby development situation, you won't be working with just one version of Ruby. This is because Ruby is in relatively aggressive development: today it may be 2.1, in a few months, it may be 2.1.2. And on top of that, the actual Ruby libraries, such as Rails, have their own development cycles and versions.

So to be blunt, you're going to have to install and maintain a wide variety and combination of Ruby-related software. This would be a deal-killer except that:

1. Both Ruby and Rails have a pretty good support and backwards-compatability cycle. I'd estimate that I still use 90% of what I started with five years ago (Rails 2.2.x and Ruby 1.8.6), with the rest being sugar on top.
2. There is __rbenv__ and __rvm__

__rbenv__ and __rvm__ abstract the work of organizing all the Ruby evnironments that you end up installing. I do my work on 3 different computers, on applications that range from Ruby 1.9.3 + Rails 3.2.x, to Ruby 2.0 and Rails 4.1beta, and I rarely ever have a misstep thanks to how well the __rbenv__ and __rvm__ helper libraries take care of things.

That said, I'll only be going over the installation of __rbenv__. I've used __rvm__ for a long time without too many problems, but they can't co-exist on the same system, and __rbenv__ seems to keep things simpler for most development situations.


#### Install rbenv with Homebrew

The easiest way to install __rbenv__ is with Homebrew:

    brew install rbenv


#### Install ruby-builder


#### Edit your path


#### Install some rubies


#### Set the default Ruby


### Rubygems

#### Update Rubygems

#### Update rake 


### Install Rails

    gem install rails

### Install MySQL

#### Install MySQL 

    brew install mysql

#### Setup Mysql to autoload

#### Install the mysql2 gem

    gem install mysql2


### Test it out

Open a __new__ Terminal window and try out these diagnostic commands:

What version of Homebrew do we have?

    $ brew -v
    Homebrew 0.9.5


What version of __Ruby__ are we running?

    $ ruby -v
    ruby 2.0.0p451 (2014-02-24 revision 45167) [x86_64-darwin13.1.0]

Where is the actual `ruby` binary (or its symlink?):

    $ which ruby
    /Users/dairy/.rbenv/shims/ruby

What version of __Rubygems__ do we have?

    $ gem -v
    2.0.14

Which __gems__ are currently installed?

    $ gem list

What version of the __rake__ gem do we have?

    $ rake -V
    rake, version 10.1.1

What is the current default version of the __Ruby on Rails__ gem?

    $ rails -v
    Rails 4.0.2


What version of __MySQL__ is installed?

    $ mysql --version
    mysql  Ver 14.14 Distrib 5.6.16, for osx10.9 (x86_64) using  EditLine wrapper



### Ruby per project

We won't get into it now, but all of this work has set the groundwork for flexible Ruby on Rails development.

### .ruby-version

TK




    


