class PurchaseManagementsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :sale_product, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
    @product_listing = ProductListing.find(params[:product_listing_id])
  end

  def create
    @product_listing = ProductListing.find(params[:product_listing_id])
    @purchase_address = PurchaseAddress.new(purchase_management_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_management_params
    params.require(:purchase_address).permit(:postal_code, :municipality, :address, :building_name, :phone_number, :delivery_area_id).merge(
      product_listing_id: params[:product_listing_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product_listing.price,
      card: purchase_management_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path unless current_user.id != ProductListing.find(params[:product_listing_id]).user.id
  end

  def sale_product
    @product_listing = ProductListing.find(params[:product_listing_id])
    redirect_to root_path if user_signed_in? && !@product_listing.purchase_management.nil?
  end
end
