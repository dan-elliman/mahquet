class DealsController < ApplicationController
  def new
    @deal_offer = Offer.find(params[:offer_id])
    @deal = Deal.new(:deal_price => @deal_offer.offer_price)
  end

  def create
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
  end

private
def deal_params
      params.require(:deal).permit(:deal_price, :buyer_id, :seller_id, :offer_terms, :listing_id, :offer_deposit,
            :ps_deposit, :purchase_sale_date, :closing_date, :financing_amount, :mortgage_contingency_date)
    end

end
