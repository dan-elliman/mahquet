class Offer < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user
  has_many :counter_offers
  #validates :offer_price, :offer_deposit, :ps_deposit, :purchase_sale_date, :closing_date, presence: true
  #validates :offer_price, :offer_deposit, :ps_deposit, numericality: {greater_than_or_equal_to: 0.01}
end
