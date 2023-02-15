class CreateSkyBungalows < ActiveRecord::Migration[7.0]
  def change
    create_table :sky_bungalows do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :price
      t.integer :beds
      t.integer :baths
      t.text :image
      t.string :sky_captain
      t.string :email
      t.string :phone
      t.integer :user_id

      t.timestamps
    end
  end
end
