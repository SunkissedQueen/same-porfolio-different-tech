class Chicken < ApplicationRecord
  validates :name, :age, :hobbies, :image, presence: true
  validates :hobbies, length: { minimum: 10 }
end
