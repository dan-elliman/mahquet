class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :street_address
      t.string :street_address_2
      t.string :area_code
      t.string :state
      t.integer :listing_price
      t.string :city
      t.text :description
      t.integer :number_bedrooms
      t.integer :number_full_baths
      t.integer :number_half_baths
      t.integer :living_area
      t.string :lot_size
      t.integer :taxes
      t.integer :number_living_levels
      t.boolean :master_bathroom
      t.integer :garage_spaces
      t.integer :parking_spaces
      t.string :year_built
      t.boolean :waterfront
      t.string :heating
      t.string :cooling
      t.boolean :lead_paint
      t.string :lot_description
      t.string :sf_style
      t.string :foundation_description

      t.timestamps null: false
    end
  end
end
