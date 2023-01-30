require 'rails_helper'

RSpec.describe Chicken, type: :model do
  it "should validate name" do
    chicken = Chicken.create
    expect(chicken.errors[:name]).to_not be_empty
  end
end
