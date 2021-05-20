FactoryBot.define do
  factory :order_address do
    association :user
    association :item
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '333-3333' }
    prefecture_id { 2 }
    city          { '名古屋' }
    address       { '1-1-1' }
    building_name { 'koko' }
    phone_number  { '09012345678' }
  end
end
