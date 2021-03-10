class PurchaseManagement < ApplicationRecord
  belongs_to :user
  belongs_to :product_listing
  has_one    :shipping_address
end
