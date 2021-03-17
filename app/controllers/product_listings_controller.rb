class ProductListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :sale_product, only: [:edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @product_listing.update(product_listing_params)
      redirect_to product_listing_path
    else
      render :edit
    end
  end

  def destroy
    if @product_listing.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def product_listing_params
    params.require(:product_listing).permit(:image, :product_name, :product_description, :category_id, :product_status_id,
                                            :delivery_fee_burden_id, :delivery_area_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == ProductListing.find(params[:id]).user.id
  end

  def set_product
    @product_listing = ProductListing.find(params[:id])
  end

  def sale_product
    redirect_to root_path if current_user.id != @product_listing.user.id || !@product_listing.purchase_management.nil?
  end
end
