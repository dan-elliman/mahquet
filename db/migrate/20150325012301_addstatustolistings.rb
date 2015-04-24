class Addstatustolistings < ActiveRecord::Migration
  def change
    add_column :listings, :status, :integer
  end
end
