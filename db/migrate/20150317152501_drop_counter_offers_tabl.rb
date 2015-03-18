class DropCounterOffersTabl < ActiveRecord::Migration
  def up
    drop_table :counter_offers
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
