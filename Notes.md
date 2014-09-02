rails new evmgr
git commit -m "Initial import rails new evmgr;bundle install"
rails generate controller home index
rails generate scaffold Event title:string next_occurrence:datetime



Examples:
    `rails generate scaffold post`
    `rails generate scaffold post title body:text published:boolean`
    `rails generate scaffold purchase amount:decimal tracking_id:integer:uniq`
~/wkpro/evmgr saasbook@saasbook (master) $ rails generate scaffold Event title:string next_occurrence:datetime
      invoke  active_record
      create    db/migrate/20140830141730_create_events.rb
      create    app/models/event.rb
      invoke    test_unit
      create      test/unit/event_test.rb
      create      test/fixtures/events.yml
      invoke  resource_route
       route    resources :events
      invoke  scaffold_controller
      create    app/controllers/events_controller.rb
      invoke    erb
      create      app/views/events
      create      app/views/events/index.html.erb
      create      app/views/events/edit.html.erb
      create      app/views/events/show.html.erb
      create      app/views/events/new.html.erb
      create      app/views/events/_form.html.erb
      invoke    test_unit
      create      test/functional/events_controller_test.rb
      invoke    helper
      create      app/helpers/events_helper.rb
      invoke      test_unit
      create        test/unit/helpers/events_helper_test.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/events.js.coffee
      invoke    scss
      create      app/assets/stylesheets/events.css.scss
      invoke  scss
      create    app/assets/stylesheets/scaffolds.css.scss
~/wkpro/evmgr saasbook@saasbook (master *) $ rake db:create
db/development.sqlite3 already exists
~/wkpro/evmgr saasbook@saasbook (master *) $ rake db:migrate
==  CreateEvents: migrating ===================================================
-- create_table(:events)
   -> 0.0023s
==  CreateEvents: migrated (0.0038s) ==========================================

~/wkpro/evmgr saasbook@saasbook (master *) $ rails s
=> Booting WEBrick
=> Rails 3.2.18 application starting in development on http://0.0.0.0:3000
=> Call with -d to detach
=> Ctrl-C to shutdown server
[2014-08-30 15:33:29] INFO  WEBrick 1.3.1
[2014-08-30 15:33:29] INFO  ruby 1.9.3 (2013-06-27) [i686-linux]
[2014-08-30 15:33:29] INFO  WEBrick::HTTPServer#start: pid=4660 port=3000

