class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      
      t.integer :offer_id
      t.integer :buyer_id
      t.integer :seller_id
      t.integer :deal_price
      t.text :offer_terms
      t.integer :listing_id
      t.integer :offer_deposit
      t.integer :ps_deposit
      t.date :purchase_sale_date
      t.date :closing_date
      t.decimal :financing_amount
      t.date :mortgage_contingency_date   
      t.timestamps null: false
      
    end
  end
end
