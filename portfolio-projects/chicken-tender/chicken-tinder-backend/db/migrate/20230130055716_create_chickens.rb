class CreateChickens < ActiveRecord::Migration[7.0]
  def change
    create_table :chickens do |t|
      t.string :name
      t.integer :age
      t.text :hobbies
      t.text :image

      t.timestamps
    end
  end
end
