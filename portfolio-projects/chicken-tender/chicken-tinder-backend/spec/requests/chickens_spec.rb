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

end
