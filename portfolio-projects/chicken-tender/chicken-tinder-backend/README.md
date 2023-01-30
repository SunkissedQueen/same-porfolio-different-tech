## README

### Setup
- created rails app to control API for decoupled project
  - $ rails new chicken-tinder-backend -d postgresql -T
  - $ cd chicken-tinder-backend
- deleted git file so I could track on my portfolio github repo
  - $ ls -a
  - $ rm -rf .git
- remove files on git ignore
  - Add .DS_Store to .gitignore
  - $ git rm -r --cached .
- create database and setup testing of rails app
  - $ rails db:create
  - $ bundle add rspec-rails
  - $ rails generate rspec:install
- add the model, migration, controller, spec files, and all the RESTful routes using rails generation for resource
  - $ rails generate resource Chicken name:string age:integer hobbies:text image:text
  - $ rails db:migrate

### Seeds
- Store mock data in db/seeds.rb to populate our database with one command rather than manually importing data through the Rails console.
```ruby
  chickens = [
    {
      name: 'Bart',
      age: 9,
      hobbies: 'Long morning calls regardless of weather',
      image: 'bart.avif'
    },
    {
      name: 'Penelope',
      age: 7,
      hobbies: 'Maintaining organic kernel business',
      image: 'penelope.avif'
    },
    {
      name: 'Reba',
      age: 17,
      hobbies: 'Encouraging others to be proud of their feathers',
      image: 'reba.avif'
    },
    {
      name: 'Roscoe',
      age: 7,
      hobbies: 'Fluffing feathers anywhere anytime',
      image: 'roscoe.avif'
    }
  ]

  chickens.each do |bird|
    Chicken.create bird
    puts "creating chicken #{bird}"
  end
```

- To add seeds to the database, ensure database has been created, given resource or model, and migrated: 
  - $ rails db:seed

- Enable our Rails application to accept requests from the React application
```ruby
  # Skip Authenticity Token in app/controllers/application_controller.rb
    class ApplicationController < ActionController::Base
      skip_before_action :verify_authenticity_token
    end

  # This project will involve two different application to run on two different servers. Allow the Rails app to accept requests from any outside domain using Cross-Origin Resource Sharing (CORS). 
  
  # Adding this line of code to the Gemfile:
    gem 'rack-cors', :require => 'rack/cors'

  # Add a file config/initializers/cors.rb 
  
  # Add the following code to that file:
    # Avoid CORS issues when API is called from the frontend app.
    # Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

    # Read more: https://github.com/cyu/rack-cors

    Rails.application.config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'  # <- change this to allow requests from any domain while in development.

        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end
    
  # Update the dependencies: $ bundle
```

### Endpoints
- Stub endpoints for the crud actions in app/controllers/cats_controller.rb
```ruby
  class CatsController < ApplicationController

    def index
    end

    def create
    end

    def update
    end

    def destroy
    end

  end
```
- Create a test for each endpoint in `spec/requests/chickens_request_spec.rb`
- Run the test: $ rspec spec/requests/chickens_request_spec.rb
- Verify good failure
- Write the logic to make the test pass
- Run the test: $ rspec spec/requests/chickens_request_spec.rb
- Verify valid pass

### Validations
- Create a test in `spec/models/chicken_spec.rb` that will look for an error if a chicken is created without valid attributes
- Run the test: $ rspec spec/models/chicken_spec.rb
- Verify good failure
- Write the logic to make the test pass in app/models/chicken.rb
- Run the test: $ rspec spec/models/chicken_spec.rb
- Verify valid pass



