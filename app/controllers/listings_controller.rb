class ListingsController < ApplicationController
  
  def new
    if user_signed_in?
    @listing = Listing.new
  else
    redirect_to new_user_registration_path
    end
  end

  def create
    @listing = Listing.create(listing_params)
    @listing.user_id = current_user.id if current_user
    if @listing.save
      redirect_to listings_path
    end
  end
  
  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all
  end
  
   # GET /listings/1
  # GET /listings/1.json
  def show
    @listing = Listing.find(params[:id])
    @listing_author = @listing.user_id
  end
  
  # GET /listings/1/edit
  def edit
    @listing_author = Listing.find(params[:id]).user_id
    if @listing_author.to_s == current_user.id.to_s
      @listing = Listing.find(params[:id])
    else
      redirect_to listings_path
      flash[:notice] =  'You do not have access to edit that listing.' 
    end
  end
  
  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    @listing = Listing.find(params[:id])
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end
  
  def listing_params
      params.require(:listing).permit(:street_address, :city, :image, :area_code, :listing_price, :description,
      :state, :number_bedrooms, :number_full_baths, :number_half_baths, :living_area, :lot_size, :taxes,
      :number_living_levels, :master_bathroom, :garage_spaces, :parking_spaces, :year_built, :waterfront,
      :heating, :cooling, :lead_paint, :lot_description, :sf_style, :foundation_description)
  end
  
end
