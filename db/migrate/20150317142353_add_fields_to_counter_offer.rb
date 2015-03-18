class AddFieldsToCounterOffer < ActiveRecord::Migration
  def change
    add_column :counter_offers, :buyer_id, :integer
    add_column :counter_offers, :seller_id, :integer
  end
end
