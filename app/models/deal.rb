class Deal < ActiveRecord::Base
  belongs_to :offer
  belongs_to :counter_offer
end
