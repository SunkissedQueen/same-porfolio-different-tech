require 'rails_helper'

RSpec.describe Chicken, type: :model do
  it "should validate name" do
    chicken = Chicken.create
    expect(chicken.errors[:name]).to_not be_empty
  end

  it "should validate age" do
    chicken = Chicken.create(
      name: 'Cluck Norris',
      hobbies: 'Defending the chicken coop',
      image: 'cluck.avif'
    )
    expect(chicken.errors[:age]).to_not be_empty
  end

  it "should validate hobbies" do
    chicken = Chicken.create(
      name: 'Cluck Norris',
      age: 12,
      image: 'cluck.avif'
    )
    expect(chicken.errors[:hobbies]).to_not be_empty
  end

  it "should validate images" do
    chicken = Chicken.create(
      name: 'Cluck Norris',
      age: 12,
      hobbies: 'Defending the chicken coop',
    )
    # p chicken.errors
    expect(chicken.errors[:image]).to eq ["can't be blank"]
  end

  it 'should validate that the hobbies entry is at least 10 characters' do
    chicken = Chicken.create(
      name: 'Cluck Norris',
      age: 12,
      hobbies: 'Defending',
      image: 'cluck.avif'
    )
    # p chicken.errors[:hobbies]
    expect(chicken.errors[:hobbies]).to_not be_empty
    expect(chicken.errors[:hobbies][0]).to eq "is too short (minimum is 10 characters)"
  end
end
