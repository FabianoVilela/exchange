# README

## An APP about Currency exchange

Our main goal is to build a wepapp to pratice to connect an API, Deployment Heroku, Continuous Integration and TDD.


It'll be a webapp where we can simulate currency exchange.

![Sample image](http://https://github.com/FabianoVilela/exchange/blob/master/sample.jpg)

We are an open source project.

So, WELCOME!

## Our technologies

- Rails 
- Docker

## First setup for running

At first, you need to setup some configurations after clonning the repo to your local machine.

### Create your own database.yml

On the repo we have a file _database-sample.yml_ on config dir.

### Setup in your machine

 As we use docker, we have a _docker-compose.yml_ for it.
 
 If you want to use, your first step must be create your _database.yml_ with the following content:
 
 ```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: db
  user: postgres  

development:
  <<: *default
  database: app_development

test:
  <<: *default
  database: app_test

production:
  <<: *default
  database: app_production
  password: <%= ENV['APP_DATABASE_PASSWORD'] %>

 ```
 
 After creating this file, run the following commands:
 
 ```sh
 1. docker-compose build
 2. docker-compose run --rm app bundle install
 3. docker-compose run --rm app bundle exec rails db:create
 4. docker-compose run --rm app bundle exec rails db:migrate
 5. docker-compose up
 ```