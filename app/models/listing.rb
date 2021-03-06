class Listing < ActiveRecord::Base
  has_many :offers
  has_many :showings
  
  has_attached_file :image,
  styles: { small: "64x64", med: "100x100", large: "500x500" }
  validates_attachment_content_type :image, :content_type => /\Aimage/
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpeg\Z/, /jpg\Z/, /PNG\Z/, /JPEG\Z/, /JPG\Z/]
  # Explicitly do not validate
  do_not_validate_attachment_file_type :image
  
  #define statuses for Listings
  enum status: [ :active, :cancelled, :under_agreement ]
  
end
