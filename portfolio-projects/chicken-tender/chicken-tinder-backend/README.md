## README

### Setup branch:setup
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

### Checkout rails app
- To see that rails app built correctly: $ rails s
- To see all applicable routes: $ rails routes -E
- To interact with database: $ rails c

### Seeds branch:seeds
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

- To view chickens in rails console
  > Chicken.all
  > Chicken.count


### CORS branch:cors
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

    # Read more: https://github.com/cyu/rack-cors, https://www.stackhawk.com/blog/rails-cors-guide/
    

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

### Endpoints branch:endpoints
- Stub endpoints for the crud actions in app/controllers/chickens_controller.rb
```ruby
  class ChickensController < ApplicationController

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
- Create a test for each endpoint in `spec/requests/chickens_spec.rb`
- Run the test: $ rspec spec/requests/chickens_spec.rb
- Verify good failure
```bash
  Chickens
    GET /index
      gets a list of chickens (FAILED - 1)

  Failures:

    1) Chickens GET /index gets a list of chickens
      Failure/Error: get '/chickens'
      
      ActionController::MissingExactTemplate:
        ChickensController#index is missing a template for request formats: text/html
  Finished in 0.07107 seconds (files took 2.18 seconds to load)
  1 example, 1 failure

  Failed examples:

  rspec ./spec/requests/chickens_spec.rb:5 # Chickens GET /index gets a list of chickens
```
- Write the logic to make the test pass
```ruby
  def index
    chickens = Chicken.all
    render json: chickens
  end
```
- Run the test: $ rspec spec/requests/chickens_spec.rb
- Verify valid pass
```bash
  Chickens
    GET /index
      gets a list of chickens

  Finished in 0.05266 seconds (files took 0.90778 seconds to load)
  1 example, 0 failures
```

- NOTES
```ruby
  # create endpoint testing
  chicken = JSON.parse(response.body)
  p chicken
  expect(chicken.length).to eq 1
  # Failure because output is a hash and therefore will count the amount of key:value pairs
  # Pass on index because output is an array with one value

  # However, can use body response to match the expected values for the new chicken
  chicken = JSON.parse(response.body)
  # p chicken
  expect(chicken.keys).to include("name", "age", "hobbies", "image")
  expect(chicken.values).to include('Cluck Norris', 12, 'Defending the chicken coop', 'cluck.avif')
end
```

  - to understand more about response: https://www.rubypigeon.com/posts/examining-internals-of-rails-request-response-cycle/

### Validations
- Create a test in `spec/models/chicken_spec.rb` that will look for an error if a chicken is created without valid attributes
- Run the test: $ rspec spec/models/chicken_spec.rb
- Verify good failure
```bash
  Chicken
    should validate name (FAILED - 1)

  Failures:

    1) Chicken should validate name
      Failure/Error: expect(chicken.errors[:name]).to_not be_empty
        expected `[].empty?` to be falsey, got true
      # ./spec/models/chicken_spec.rb:6:in `block (2 levels) in <top (required)>'

  Finished in 0.02664 seconds (files took 0.79888 seconds to load)
  1 example, 1 failure

  Failed examples:

  rspec ./spec/models/chicken_spec.rb:4 # Chicken should validate name
```
- Write the logic to make the test pass in app/models/chicken.rb
- Run the test: $ rspec spec/models/chicken_spec.rb
- Verify valid pass
```bash
  Chicken
    should validate name

  Finished in 0.02444 seconds (files took 0.83741 seconds to load)
  1 example, 0 failures
```

- Write a test in request folder to ensure correct response status when we submit a create request without chicken attributes
- Run the test:
- See good failure if a status is not on endpoint
```bash
  Failures:

    1) Chickens POST /create cannot create a chicken without a name
      Failure/Error: expect(response).to have_http_status(422)
        expected the response to have status code 422 but it was 200
```
- Passing
```bash
  Chickens
    GET /index
      gets a list of chickens
    POST /create
      creates a chicken
      cannot create a chicken without a name
    PATCH /update
      modifies a chicken
    DELETE /destroy
      deletes a chicken

  Finished in 0.06942 seconds (files took 0.85081 seconds to load)
  5 examples, 0 failures
```
