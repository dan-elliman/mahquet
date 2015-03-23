class OffersController < ApplicationController
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_path
  
  def new
    @listing = Listing.find(params[:id])
    @offer = @listing.offers.build
  end
  
  def create
    @listing = Listing.find(params[:id])
    @offer = @listing.offers.build(offer_params)
    @offer.user_id = current_user.id if current_user
    if @offer.save
      flash[:notice] = 'Your offer has been created'
      redirect_to offer_path(:id => @offer.id)
    else
      flash[:notice] = 'You missed something in your offer'
        redirect_to new_offer_path(:id => @listing.id)
    end
      
  end
  
  def show    
      if show_auth == true
      @offer = Offer.find(params[:id])
      @listing = Listing.find(@offer.listing_id)
      @offer_ratio = (@offer.offer_price.to_f / @listing.listing_price)
      @finance_ratio = (@offer.financing_amount.to_f / @offer.offer_price)
      @counter_offer = CounterOffer.where(offer_id: @offer.id) 
    else
      redirect_to listings_path
      end
  end
  
  def index
  end
  
  def show_auth
   @offer_author = Offer.find(params[:id]).buyer_id
  logger.debug "Offer_author is: #{@offer_author}"
  @listing_check = Offer.find(params[:id]).listing_id
  logger.debug "Listing_check is: #{@listing_check}"
  @listing_author = Listing.find(@listing_check).user_id
  logger.debug "Listing_author is: #{@listing_author}"
  @logged_in = current_user.id
  logger.debug "Logged_in is: #{@logged_in}"
    if @offer_author.to_s == @logged_in.to_s || @listing_author.to_s == @logged_in.to_s
      return true
    else
      return false
    end
  end
  
  private
  def offer_params
    params.require(:offer).permit(:offer_price, :offer_terms, :mortgage_contingency_date, :financing_amount, :closing_date, :purchase_sale_date, :offer_deposit, :ps_deposit, :listing_id, :offer_expiration, :buyer_id, :seller_id)
  end
  
  def invalid_path
  logger.error "Attempt to access invalid counter-offer"
  redirect_to listings_path, notice: "Whoops!  You can't go there.  That's an Invalid Page."
  end
  
end
