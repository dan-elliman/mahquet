class AddFieldsToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :offer_deposit, :integer
    add_column :offers, :ps_deposit, :integer
    add_column :offers, :purchase_sale_date, :date
    add_column :offers, :closing_date, :date
    add_column :offers, :financing_amount, :decimal
    add_column :offers, :mortgage_contingency_date, :date
  end
end
