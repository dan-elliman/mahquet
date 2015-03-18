class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :offer_price
      t.text :offer_terms
      t.date :offer_expiration
      t.integer :listing_id

      t.timestamps null: false
    end
  end
end
