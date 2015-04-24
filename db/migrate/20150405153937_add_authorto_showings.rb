class AddAuthortoShowings < ActiveRecord::Migration
  def change
    
    add_column :showings, :user_id, :integer
    add_column :showings, :seller_id, :integer
    
  end
end
