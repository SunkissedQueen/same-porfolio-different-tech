# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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