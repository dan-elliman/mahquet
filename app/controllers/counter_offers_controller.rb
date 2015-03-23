class CounterOffersController < ApplicationController
 before_action :authenticate_user!
rescue_from ActiveRecord::RecordNotFound, with: :invalid_path

  def new
    @offer = Offer.find(params[:id])
    @counter_offer = @offer.counter_offers.build
  end
  
  def create
    @offer = Offer.find(params[:id])
    @counter_offer = @offer.counter_offers.create(counter_offer_params)
    if @counter_offer.save
      flash[:notice] = 'Your counter-offer has been created'
      redirect_to counter_offer_path(:id => @counter_offer.id)
    end
  end

  def show
    if check_auth == true
    @counter_offer = CounterOffer.find(params[:id])
    @listing = Listing.find(@counter_offer.listing_id)
    @offer = Offer.find(@counter_offer.offer_id)
    @offer_ratio = (@counter_offer.offer_price.to_f / @listing.listing_price)
    @offer_delta = (@offer.offer_price - @counter_offer.offer_price)
    @deposit_delta = (@offer.offer_deposit - @counter_offer.offer_deposit)
    @ps_delta = (@offer.ps_deposit - @counter_offer.ps_deposit)
  else
    redirect_to listings_path
  end
  end
  
  def check_auth
    @buyer_id = CounterOffer.find(params[:id]).buyer_id
    logger.debug "Buyer ID is: #{@buyer_id}"
    @seller_id = CounterOffer.find(params[:id]).seller_id
    logger.debug "Seller ID is: #{@seller_id}"
    @logged_in = current_user.id
    logger.debug "Current User is #{@logged_in}"
    if @buyer_id == @logged_in || @seller_id == @logged_in
      return true
    else
      return false
    end
    
  end
  
  private
  def counter_offer_params
    params.require(:counter_offer).permit(:offer_price, :buyer_id, :seller_id, :offer_terms, :mortgage_contingency_date, :financing_amount, :closing_date, :purchase_sale_date, :offer_deposit, :ps_deposit, :listing_id, :offer_expiration, :offer_id)
  end

def invalid_path
  logger.error "Attempt to access invalid counter-offer"
  redirect_to listings_path, notice: "Whoops!  You can't go there.  That counter offer doesn't exist or you don't have access to it."
end
end