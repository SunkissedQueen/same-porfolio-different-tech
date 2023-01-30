require 'rails_helper'

RSpec.describe "Chickens", type: :request do
  describe "GET /index" do
    it "gets a list of chickens" do
      Chicken.create(
        name: 'Cluck Norris',
        age: 12,
        hobbies: 'Defending the chicken coop',
        image: 'cluck.avif'
      )

      # Make a request
      get '/chickens'

      chicken = JSON.parse(response.body)
      # p chicken
      expect(response).to have_http_status(200)
      expect(chicken.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a chicken" do
      chicken_params = {  
        chicken: {
          name: 'Cluck Norris',
          age: 12,
          hobbies: 'Defending the chicken coop',
          image: 'cluck.avif'
        }
      }

      # Make a request
      post '/chickens', params: chicken_params
      # status code
      expect(response).to have_http_status(200)
      # payload
      chick = Chicken.first
      expect(chick.name).to eq('Cluck Norris')
      expect(chick.age).to eq(12)
      expect(chick.hobbies).to eq('Defending the chicken coop')
      expect(chick.image).to eq('cluck.avif')

      chicken = JSON.parse(response.body)
      # p chicken
      expect(chicken.keys).to include("name", "age", "hobbies", "image")
      expect(chicken.values).to include('Cluck Norris', 12, 'Defending the chicken coop', 'cluck.avif')
    end
  end


end
