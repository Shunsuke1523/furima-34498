FactoryBot.define do
  factory :product_listing do
    product_name           { 'aaa' }
    product_description    { 'aaa' }
    price                  { 10000 }
    category_id            { 2 }
    product_status_id      { 2 }
    delivery_fee_burden_id { 2 }
    delivery_area_id       { 2 }
    delivery_days_id       { 2 }
    association :user
  end
end
