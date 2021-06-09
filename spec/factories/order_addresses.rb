FactoryBot.define do
  factory :order_address do
    postcode      { '123-4567' }
    ship_from_id  { 7 }
    city          { '新宿区' }
    block         { '新宿1-1' }
    building      { '新宿ハイツ' }
    phone_number  { '09012345678' }
  end
end
