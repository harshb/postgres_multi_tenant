
Just some notes when developing
--------------------------------

 bundle Install
-------------
After making changes to the gem file, you must run  bundle install

Installing Postgres
---------
 http://stackoverflow.com/questions/7086654/installing-postgres-on-windows-for-use-with-ruby-on-rails
 
add in gemfile gem 'pg', '0.11.0'

 rails new pg --database=postgresql
 
 rails generate scaffold Post title:string author:string body:text
 rails generate scaffold Tenant subdomain:string user_name:string 

 rake db:migrate
 

 create a database
 
database.yml
-------------
development:
  adapter: postgresql
  database: multi
  username: hbhas # replace this with your own user name
  password: Passw0rdPassw0rd # replace this with your own password
  host: localhost
  encoding: UTF8
  pool: 5
  timeout: 5000
  
  
Subdomain Localhost
----------------------
In system32/drivers/etc/hosts

127.0.0.1 : abc.ritsah.com
127.0.0.1 : ritsah.com

then call url like so:

 http://ritsah.com:3000
 http://abc.ritsah.com:3000
 
  http://ritsah.com:3000/tenants
 http://abc.ritsah.com:3000/tenants
 
 debugging
 ----------
 response.write equivalent:
 
 render :text => "hello"

 #log file
 
 logger.debug "hb"

then look up log file in log/development.log


Subdomains Heroku
----------------
http://devcenter.heroku.com/articles/custom-domains
use  Wildcard Domains


Double colon meaning
--------------------
The :: is a unary operator that allows: constants, instance methods and class methods defined within a class or module, to be accessed from anywhere outside the class or module.

:: is basically a namespace resolution operator. It allows you to access items in modules, or class-level items in classes. For example, say you had this setup:

module SomeModule
    module InnerModule
        class MyClass
            CONSTANT = 4
        end
    end
end


You could access CONSTANT from outside the module as SomeModule::InnerModule::MyClass::CONSTANT.

 MyApp::SHARED_TABLES.each { |name| connection.execute %{drop table "#{name}"} 
 
 

Reload
-------
reload!


Debugger
--------

http://guides.rubyonrails.org/debugging_rails_applications.html

1.sudo gem install ruby-debug19

2.invoke the debugger by calling the debugger method.

class PeopleController < ApplicationController
  def new
    debugger
    @person = Person.new
  end
end


3. Make sure you have started your web server with the option --debugger:

rails server --debugger



Hack/Patch
----------

https://github.com/rails/rails/pull/3232

Clear Cache bewore switching schema
ActiveRecord::Base.connection.clear_cache! # HACK: Workaround

or
As per the apartment gem
use: for Rails 3.1.x: Rails ~> 3.1.2
https://github.com/bradrobertson/apartment