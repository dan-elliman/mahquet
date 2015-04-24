class DealsController < ApplicationController
  def new
    @deal_offer = Offer.find(params[:offer_id])
    @deal = Deal.new(:deal_price => @deal_offer.offer_price)
  end

  def create
    @deal_offer = Offer.find(params[:offer_id])
    @deal = Deal.create(deal_price: @deal_offer.offer_price, buyer_id: @deal_offer.buyer_id, seller_id: @deal_offer.seller_id,
                        offer_terms: @deal_offer.offer_terms, listing_id: @deal_offer.listing_id, offer_deposit: @deal_offer.offer_deposit,
                        ps_deposit: @deal_offer.ps_deposit, purchase_sale_date: @deal_offer.purchase_sale_date, closing_date: @deal_offer.closing_date,
                        financing_amount: @deal_offer.financing_amount, mortgage_contingency_date: @deal_offer.mortgage_contingency_date)
   #Define the listing attached to the deal so we can change the listing status to 'Under Agreement'
   @listing = Listing.find(@deal.listing_id)
   @listing.under_agreement!
    if @deal.save
      redirect_to deal_path(id: @deal.id)
    end
  end
  
   def counter_create
    @deal_offer = Offer.find(params[:offer_id])
    #@offer_price = @deal_offer.offer_price
    @deal = Deal.create(deal_price: @deal_offer.offer_price, buyer_id: @deal_offer.buyer_id, seller_id: @deal_offer.seller_id,
                        offer_terms: @deal_offer.offer_terms, listing_id: @deal_offer.listing_id, offer_deposit: @deal_offer.offer_deposit,
                        ps_deposit: @deal_offer.ps_deposit, purchase_sale_date: @deal_offer.purchase_sale_date, closing_date: @deal_offer.closing_date,
                        financing_amount: @deal_offer.financing_amount, mortgage_contingency_date: @deal_offer.mortgage_contingency_date)
    if @deal.save
      redirect_to listings_path
    end
  end

  def show
    if show_auth == true
     @deal = Deal.find(params[:id])
   else
     redirect_to listings_path, notice: "Whoops!  You can't go there.  You don't have access to that deal."
    end
  end
  
  def show_auth
  @buyer_id = Deal.find(params[:id]).buyer_id
  @seller_id = Deal.find(params[:id]).seller_id
  logger.debug "Listing_check is: #{@listing_check}"
    if current_user.id == @buyer_id || current_user.id == @seller_id
      return true
    else
      return false
    end
  end

private
def deal_params
      params.require(:deal).permit(:deal_price, :buyer_id, :seller_id, :offer_terms, :listing_id, :offer_deposit,
            :ps_deposit, :purchase_sale_date, :closing_date, :financing_amount, :mortgage_contingency_date)
    end

end
