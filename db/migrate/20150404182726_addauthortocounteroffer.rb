class Addauthortocounteroffer < ActiveRecord::Migration
  def change
     add_column :counter_offers, :author, :integer
  end
end
