FactoryBot.define do
  factory :item do
    name                  { Faker::Name.initials(number: 2) }
    description           { Faker::Lorem.sentence }
    category_id           { 4 }
    condition_id          { 4 }
    ship_charge_id        { 4 }
    ship_from_id          { 4 }
    ship_days_id          { 4 }
    price                 { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
