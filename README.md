[ ![Codeship Status for FabianoVilela/exchange](https://app.codeship.com/projects/0b1ced60-811a-0135-2ebc-3eef9e3cedd4/status?branch=master)]()
# README

## An APP about Currency exchange

Our main goal is to build a wepapp to pratice to connect to [Fixer.io](http://fixer.io/) API, Deployment Heroku, Continuous Integration and TDD.

## Features
* Selection of currencies from a dropdown
* Input the amount in the desired currency, obtaining the immediately amount in the other selected currency.
* Swap currencies convertion between each other.

**[Visit the app in Heroku](https://xchange-app.herokuapp.com/)**


It'll be a webapp where we can simulate currency exchange.

![Sample image](http://https://github.com/FabianoVilela/exchange/blob/master/sample.jpg)

We are an open source project.

So, WELCOME!

## Our technologies
* [Ruby on Rails](http://rubyonrails.org/)
* [Docker](https://docs.docker.com/get-started/)
* [TDD aproach](https://en.wikipedia.org/wiki/Test-driven_development)
* [CodeShip (for CI)](https://codeship.com/)

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

 ## Next steps
 * Fix tests home_specs