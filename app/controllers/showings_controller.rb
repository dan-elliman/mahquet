class ShowingsController < ApplicationController
before_action :authenticate_user!

def new
    @listing = Listing.find(params[:id])
    @showing = @listing.showings.build
end

def create
  @listing = Listing.find(params[:id])
  @showing = @listing.showings.build(showing_params)
    @showing.user_id = current_user.id if current_user
    @showing.unconfirmed!
    if @showing.save
      redirect_to showing_path(:id => @showing.id)
end
  end

def edit
end

def update
end

def show
  @showing = Showing.find(params[:id])
  @listing = Listing.find(@showing.listing_id)
end

def destroy
end

private
  def showing_params
    params.require(:showing).permit(:showing_time, :comments, :status, :listing_id, :user_id, :seller_id)
  end
  
  def invalid_path
  logger.error "Attempt to access invalid showing"
  redirect_to listings_path, notice: "Whoops!  You can't go there.  That's an Invalid Page."
  end


end
