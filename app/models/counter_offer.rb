class CounterOffer < ActiveRecord::Base
  belongs_to :offer
  has_one :deal
  
   #define statuses for CounterOffers
  enum status: [ :active, :expired ]
end
