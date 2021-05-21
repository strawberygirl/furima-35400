FactoryBot.define do
  factory :item do
    association :user
    name             { 'test' }
    description      { 'good' }
    category_id      { 2 }
    item_state_id    { 2 }
    shipping_fee_id  { 2 }
    prefecture_id    { 2 }
    shipping_time_id { 2 }
    price            { 514 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpeg'), filename: 'test.jpeg')
    end
  end
end
