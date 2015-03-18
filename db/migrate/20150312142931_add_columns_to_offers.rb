class AddColumnsToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :user_id, :string
  end
end
