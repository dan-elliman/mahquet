class CounterOffer < ActiveRecord::Base
  belongs_to :offer
  has_one :deal
end
