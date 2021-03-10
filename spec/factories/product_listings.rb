FactoryBot.define do
  factory :product_listing do
    product_name        { 'aaa' }
    product_description { 'aaa' }
    price               { 100 }
    category_id            { 1 }
    product_status_id      { 1 }
    delivery_fee_burden_id { 1 }
    delivery_area_id       { 1 }
    delivery_days_id       { 1 }
    association :user
  end
end
