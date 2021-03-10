class ProductListing < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :product_name
    validates :product_description
    validates :price
    validates :image
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000 }

  validates :price, format: { with: /\A[0-9]+\z/ }

  validates :category_id,            numericality: { other_than: 1 }
  validates :product_status_id,      numericality: { other_than: 1 }
  validates :delivery_fee_burden_id, numericality: { other_than: 1 }
  validates :delivery_area_id,       numericality: { other_than: 1 }
  validates :delivery_days_id,       numericality: { other_than: 1 }

  belongs_to :category
  belongs_to :product_status
  belongs_to :delivery_fee_burden
  belongs_to :delivery_area
  belongs_to :delivery_days
  belongs_to :user
  has_one_attached :image
end
