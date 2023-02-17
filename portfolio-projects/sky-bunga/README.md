## README

## Setup
  - $ rails new sky-bunga -d postgresql -T
  - $ rm -rf .git
  - $ rails db:create
  - $ code .
  - $ rails s

  Adding RSpec
  - $ bundle add rspec-rails
  - $ rails generate rspec:install

  Adding React
  - $ bundle add webpacker
  - $ bundle add react-rails
  - $ rails webpacker:install
  - $ rails webpacker:install:react
  - $ yarn add @babel/preset-react
  - $ yarn add @rails/activestorage
  - $ yarn add @rails/ujs
  - $ rails generate react:install
  - $ rails generate react:component App

  Adding Devise
  - $ bundle add devise
  - $ rails generate devise:install
  - $ rails generate devise User
  - $ rails db:migrate
```ruby
  # Add the following in config/environments/development.rb
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  
  # Add the following in config/initializers/devise.rb
    # Find this line:
    config.sign_out_via = :delete
    # And replace it with this:
    config.sign_out_via = :get
```

## Rails Routing
- $ rails generate controller Home index
```ruby
  # In the file app/views/home/index.html.erb add the following:

  <%= react_component 'App', {
    logged_in: user_signed_in?,
    current_user: current_user,
    new_user_route: new_user_registration_path, sign_in_route: new_user_session_path, sign_out_route: destroy_user_session_path
  } %>

  # Add the following in app/views/layouts/application.html.erb

    # Find this line:
    <%= javascript_importmap_tags %>

    # And replace it with this:
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>

    # Add the following in config/routes.rb
    get '*path', to: 'home#index', constraints: ->(request){ request.format.html? }
    root 'home#index'
```

## React Routing
- $ yarn add react-router-dom

```javascript
  // app/javascript/components/App.js
  import React from "react"
  import { BrowserRouter, Routes, Route } from "react-router-dom"

  const App = () => {
    return (
      <>
        <h1>Sky Bungalow App</h1>
      </>
    )
  }
  export default App
```

## Adding Reactstrap
- $ bundle add bootstrap
- $ mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
- $ yarn add reactstrap
```css
/* app/assets/stylesheets/application.scss */
@import "bootstrap";
```

## Sky Bungalow Resource
The Devise User model is going to have an association with the Sky Bungalow model. In this situation, the user will have many sky bungalows and the sky bungalows will belong to a user.

- $ rails g resource SkyBungalow street:string city:string state:string price:string beds:integer baths:integer image:text sky_captain:string email:string phone:string user_id:integer
- $ rails db:migrate
```ruby
  # app/models/skybungalow.rb

  class SkyBungalow < ApplicationRecord
    belongs_to :user
  end

  # app/models/user.rb

  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
    has_many :skybungalows
  end
```
```javascript
  // app/javascript/components/App.js

  import React from "react"

  const App = ({
    logged_in,
    current_user,
    new_user_route,
    sign_in_route,
    sign_out_route
  }) => {
    console.log("logged_in:", logged_in)
    console.log("current_user:", current_user)
    console.log("new_user_route:", new_user_route)
    console.log("sign_in_route:", sign_in_route)
    console.log("sign_out_route:", sign_out_route)
    return (
      <>
        <h1>Sky Bungalow App</h1>
      </>
    )
  }

  export default App

  // Header
  import React from "react"
  import { Nav, NavItem } from "reactstrap"
  import { NavLink } from "react-router-dom"

  const Navigation = () => {
    return (
      <Nav>
        <NavItem>
          <NavLink to="/" className="nav-link">
            Home
          </NavLink>
        </NavItem>
      </Nav>
    )
  }

  export default Navigation
```

## React Testing Library
- $ yarn add --dev @testing-library/react
- $ yarn add --dev jest
- $ yarn add --dev @testing-library/dom
- $ yarn add --dev jsdom global-jsdom
- $ yarn add --dev @testing-library/jest-dom
- $ yarn add -D jest-environment-jsdom

```json
  "scripts": {
      "test": "jest",
      "test-watch": "jest --watch"
    },
    "jest": {
      "testEnvironment": "jsdom",
      "roots": [
        "app/javascript/components"
      ],
      "moduleNameMapper": {
        "\\.(jpg|jpeg|png|gif|eot|otf|webp|svg|ttf|woff|woff2|mp4|webm|wav|mp3|m4a|aac|oga)$": "<rootDir>/test/javascript/__mocks__/fileMock.js",
        "\\.(css|less)$": "<rootDir>/test/javascript/__mocks__/styleMock.js"
      },
      "setupFilesAfterEnv": [
        "@testing-library/jest-dom/extend-expect"
      ]
    }
```
## ESlint
- added the following files: .eslintignore, .eslintrc.js, .eslintrc.yml
- added dev dependencies:
```bash
  - $ yarn add eslint --dev
  - $ yarn add eslint-config-standard --dev
  - $ yarn add eslint-plugin-import --dev
  - $ yarn add eslint-plugin-n eslint-plugin-promise eslint-plugin-react --dev
  - $ yarn run eslint --init
  - $ yarn run eslint .
```
- modify .eslintrc.js
```javascript
  "env": {
    "browser": true,
    "es2021": true,
    "node": true,
    "jest": true
  },
  "rules": { 
    'react/prop-types': ['off']
  }
```

## standard rb
- $ gem install standardrb -v 1.0.0
- $ bundle install