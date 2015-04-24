class Showing < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user
  
  #define statuses for Offers
  enum status: [ :unconfirmed, :confirmed, :cancelled ]
end