class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_listing_id, :postal_code, :municipality, :address, :building_name, :phone_number,
                :delivery_area_id, :token

  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
    validates :phone_number
    validates :token
  end

  validates :delivery_area_id, numericality: { other_than: 1 }

  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }

  validates :phone_number, format: { with: /\A\d{11}\z/ }

  def save
    purchase_managements = PurchaseManagement.create!(user_id: user_id, product_listing_id: product_listing_id)

    ShippingAddress.create!(postal_code: postal_code, municipality: municipality, address: address,
                            building_name: building_name, phone_number: phone_number, delivery_area_id: delivery_area_id, purchase_management_id: purchase_managements.id)
  end
end
