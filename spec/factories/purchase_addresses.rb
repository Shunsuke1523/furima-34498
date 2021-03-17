FactoryBot.define do
  factory :purchase_address do
    postal_code            { '123-4567' }
    municipality           { '横浜市緑区' }
    address                { '青山1-1-1' }
    building_name          { '柳ビル103' }
    phone_number           { 50_512_345_678 }
    delivery_area_id       { 2 }
    token                  { 'tok_abcdefghijk00000000000000000' }
  end
end
