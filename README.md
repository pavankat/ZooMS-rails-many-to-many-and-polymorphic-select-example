# Many to Many and Polymorphic Selects in Rails 4

* we'll do some fun stuff in the cat_toys_controller.rb file to make a polymorphic select work.

* however, if you want to be really fancy then leverage the global id gem for a polymorphic select: http://stefan.haflidason.com/simpler-polymorphic-selects-in-rails-4-with-global-id/

# ZooMS RAILS (Zoo Management System)

## Step 0 - SETUP

* rails new zooms --database=postgresql
* Go into the folder
* `bundle install` to install all the gems (pry-rails)
* `rake db:create` to create the server
* Your data model is this:
* a lions table and a lion.rb model:
	- columns: birthdate (date), name (string), about (text), weight (integer), health (integer), health_notes (text)
* a lion_tamers table and a lion_tamer.rb model:
	- name (string), experience (integer), living (boolean)
* a joining table for lions and lion_tamers
	- you can use this for rails to automatically make it for you :)
		* rails generate migration CreateJoinTableLionTamerLion lion_tamer lion

* run the migrations

# bonus HARD
* what if one table can belong to many tables - how do we do this? You use a technique called polymorphism. Let's do this. I had the opportunity of being the first one to introduce this into MediaMath back in 2013.

* read about polymorphism here:
	* http://guides.rubyonrails.org/association_basics.html#polymorphic-associations

* make a panthers table and a panther.rb file
	- columns: name, claw_length (integer)
* make a cat_toys table and a cat_toy.rb file

* we'll make it so a panther can have a cat toy or a lion can have a cat toy. Sound simple, but it's not. We need to have a string column that stores the type of object (Lion or Panther) that owns that cat_toy in the cat_toys table and a foreign_id column that stores the id of that Panther/Lion that owns that cat_toy.

* run this cmd in your terminal to make a polymorphic association among the panthers, lions and cat_toys tables
	rails generate migration AddToyableToCatToys toyable:references{polymorphic}

* run the migrations

## Step 1 - MODELS

* A lion_tamer has a many to many relationship with lions

# bonus

* make a polymorphic relationship among lions, panthers and cat_toys so that

* In panther.rb
	* has_many :cat_toys, :as => :toyable, dependent: :destroy

* In lion.rb
	* has_many :cat_toys, :as => :toyable, dependent: :destroy

* In cat_toy.rb
	* belongs_to :toyable, :polymorphic => true


#### Validations
* add validations for every column of the lions and lion_tamers tables

#### bonus
* add validations for every column of the pantehrs and cat_toys tables

#### SEED

* throw stuff into your seed file and then run
* `rake db:seed` to populate our tables. 

* OR
	* open up your rails console by doing: `rails c`
		* and do `Lion.create({...})`
			* the ... has the columns and values 
		* and do `LionTamer.create({...})`
		* etc ...

* bonus: do the seeding for panthers and cat_toys

#### CHECK TO SEE IF ITS ALL GOOD

* check your schema.rb file if it's all good
* go into the rails console to see if everything's good like this: `rails c`

## STEP 4 - ROUTES

* use restful routes for everything (resources :lions)

* bonus: do the routes for panthers and cat_toys

#### CHECK TO SEE IF ITS ALL GOOD

* `rake routes`

## STEP 5 - CONTROLLERS

* make your controllers 

* bonus: do the controllers for panthers and cat_toys

## STEP 6 - VIEWS

##### Your views will be similar to David's solution for the museumr app

* make sure the show pages show all the column data
* make sure the index pages show all the records
* make sure the forms let you edit every column
* make sure you use partials for the forms

* on the lion_tamers form 
	* let the user select the lions that the lion_tamer works with

```
<div class="field">
  <%= f.label :lion_ids %><br>
  <%= f.select :lion_ids, @lions.collect{|d| [ "#{d.name}", d.id ]}, { :selected => @lion_tamer.lions.pluck(:id) }, { :multiple => true, :class => 'select2'} %>
</div>
```

* make sure you have @lions = Lion.all in your new and edit actions of your lion_tamers_controller.rb

* make sure you can edit, delete and make a new record on all the index views


## MINOR BONUS

* use select2 on the multi selects

* Put this in your gemfile, and run bundle install
	`gem "select2-rails"`

* in your application.css file replace it with this:

```
/*
 * This is a manifest file that'll be compiled into application.css, which will include all the files
 * listed below.
 *
 * Any CSS and SCSS file within this directory, lib/assets/stylesheets, vendor/assets/stylesheets,
 * or vendor/assets/stylesheets of plugins, if any, can be referenced here using a relative path.
 *
 * You're free to add application-wide styles to this file and they'll appear at the bottom of the
 * compiled file so the styles you add here take precedence over styles defined in any styles
 * defined in the other CSS/SCSS files in this directory. It is generally better to create a new
 * file per style scope.
 *
 *= require select2
 *= require_tree .
 *= require_self
 */
 ```

 * in your application.js file replace it with this:

```
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require select2
//= require_tree .
```

* make a new file in your javascripts folder called select_two.js and paste this in:

```
var ready;
ready = function() {
	$('.select2').select2();
};


$(document).ready(ready);
$(document).on('page:load', ready);
```

* now your multi selects will look sweeeeet as long as you have the select2 class on them.

## Bonus - hard
* Make the form for cat_toys is made so that you can choose whether a lion or panther owns the particular cat_toy. You'll have to do some research and playing around to figure this out. There are many different ways to make this happen. 

* show the cat toys that a lion owns on the show page
* show the cat toys that a panther owns on the show page

* show all the lions' cat toys on the lions index
* show all the panthers' cat toys on the panthers index

* on a cat_toy show page, show the lion or panther that owns it
* on the cat_toys index page, show the lion or panther that owns it for all the cat_toys.
