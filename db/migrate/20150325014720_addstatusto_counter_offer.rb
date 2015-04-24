class AddstatustoCounterOffer < ActiveRecord::Migration
  def change
     add_column :counter_offers, :status, :integer
  end
end
