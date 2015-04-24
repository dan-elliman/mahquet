class CreateShowings < ActiveRecord::Migration
  def change
    create_table :showings do |t|
      
       t.datetime :showing_time
       t.integer :listing_id
       t.integer :status
       t.string :comments
       
    end
  end
end
