class ProductListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @product_listings = ProductListing.all.order(created_at: 'DESC')
  end

  def new
    @product_listing = ProductListing.new
  end

  def create
    @product_listing = ProductListing.new(product_listing_params)
    if @product_listing.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product_listing = ProductListing.find(params[:id])
  end

  private

  def product_listing_params
    params.require(:product_listing).permit(:image, :product_name, :product_description, :category_id, :product_status_id,
                                            :delivery_fee_burden_id, :delivery_area_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end
end
