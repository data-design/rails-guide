---
title: Congressmember
---

This is more theory than code, but an extremely important facet that beginners to data will critically screw up. As we'll see, Rails handles the implementation. But in real-world usage, we have to do a little of our own work to make our app as accessible as possible.

We'll also implement the ActiveRecord validators and see how they work in practice.



### Uniquely identifying records

One of the most important issues to deal with in any data application is: how do we _uniquely_ identify each record, or, in this case, Congressmember? Let's say we have this to work with:

~~~ruby
first_name: Thomas
middle_name: H.
last_name: Allen
district: 1 
state: ME
party: D
~~~

In day-to-day human interactions, we usually differentiate people by their names. Yelling _"Thomas H. Allen"_ during the House roll call should be enough to find the Congressmember we want, if there are no other "Thomas H. Allens" who are currently serving:

~~~ruby
Congressmember.where(first_name: 'Thomas', middle_name: 'H.', last_name: 'Allen').first
~~~

That's a big _if_, since "Thomas" and "Allen" are very common American names. But more importantly, in the data application world, our analysis doesn't just deal with _now_, or _just_ the 113th Congress. We intend to compare _Rep. Thomas H. Allen_, against __all__ U.S. Congressmembers, past, future, and present, and given that, we can't gurantee there will never be another _Thomas H. Allen_ in Congress.

So what about searching for a "Thomas H. Allen" who is a Democrat who represents Maine's First District? 

~~~ruby
Congressmember.where(first_name: 'Thomas', middle_name: 'H.', last_name: 'Allen', state: 'ME', party: 'D', district: 1).first
~~~


That's a little better, but _still_ not a gurantee of uniqueness. Even more problematic, what if Rep. Allen changes party from Democrat to Republican? Or changes state and district? This is a rare occurrence, but when it does happen, it means you no longer have just one way to select all of Thomas H. Allen's data:

~~~ruby
Congressmember.where(first_name: 'Thomas', middle_name: 'H.', last_name: 'Allen', district: 1).where('(party = "D" AND state = "ME") OR (party="R" AND state="NH")')
~~~

However, the biggest problem in the examples so far is the huge possibility for _human error_. What if another user or developer wants to find all of Thomas H. Allen's related data, but refers to him as "Tom" and uses his full middle name. So now the query logic (in pseudocode, because it's too much of a pain to write out):

    A Congressmember
        whose `last_name` is "Allen"
        whose `first_name` is either "Tom" OR "Thomas"
        whose `middle_name` is "H." OR "Hodge"
        who is 
            either a "Democrat" and represented "ME"
            OR a "Republican" and represented "NH"

And by now, the chances of your query hitting any number of unintended "Tom Allens" has greatly increased.

#### Primary key

This is why proper data systems often don't use human-meaningful attributes, such as names, as unique identifiers, or, as they are known in the database context, __primary keys__.

If you've already played around in Rails and created records, you'll notice that every ActiveRecord table has an `id` column automatically created. And for each new record, the `id` is incremented by 1. If the database never loses count, this gurantees that every new record will have a different `id`.

TKCODE


If by some freak electorial occurrence, the next 10 U.S. Congressmembers were named "Thomas H Allen", our `congressmembers` table would look like this:



No matter what, the Congressmember with `id: 1` will always be `1`, whether he changes his name, position, etc. and no matter how many others come after him. Thus, the primary key of `id` gives us a reliable reference to any records associated with `1`.

### Interopability with bioguide_id

Problem solved? Not quite.

You may think you're building the Congress app to end all Congress apps, but for now, you're behind many, many other data systems and applications.

We'll want to add which bills have been sponsored 
in our application. Sunlight Foundation, again, has done a great job of organizing this and supplying it through their API. But how do we get all of the bills for Congressmember "1", as he is known in our database? That primary key of `1` means nothing to the outside world, and now we're stuck looking for bills in which the sponsor has a first name of "Tom" or "Thomas", etc. etc.


This is where we have to do work beyond Rails. The `id` field is great for keeping things in order _internally_, but Rails can't tell you how your app should talk to _other_ data systems.

There's no real technical solution.


One of the most difficult aspects about data modeling is determining a way to __uniquely identify__ each record. 
The seemingly obvious unique ID for a Congressmember would be their name. Given a Congressmember record like this:


The unique ID might be: `thomas-h-allen`

So the first rule about building a unique ID is that whatever criteria you use must result in a unique identifier for all your possible records. In this situation, you can guess that "Thomas" and "Allen" are relatively common names and that at some point, either in the past or future, we'll have another "Thomas Allen" and maybe one with a "H" for a middle name. 

OK, so how about `thomas-h-allen-ME-1-D`, which includes 
And given a long enough timespan, we may have another

This identifier, often referred to as the __primary key__ in a database, serves as the canonical, never-changing value for a record.






title,firstname,middlename,lastname,name_suffix,nickname,party,state,district,in_office,gender,phone,fax,website,webform,congress_office,bioguide_id,votesmart_id,fec_id,govtrack_id,crp_id,twitter_id,congresspedia_url,youtube_url,facebook_id,official_rss,senate_class,birthdate

For a thorough exploration of unique IDs as they relate to Chicago crime reports, [check out Adrian Holovaty's guide on Source](https://source.opennews.org/en-US/learning/sane-data-updates-are-harder-you-think-part-2/).