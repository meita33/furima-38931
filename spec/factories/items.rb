FactoryBot.define do
  factory :item do
    association :user

    title               { 'タイトル' }
    detail              { '説明' }
    category_id         { 2 }
    quality_id          { 2 }
    postage_id          { 2 }
    prefecture_id       { 2 }
    shipment_date_id    { 2 }
    price               { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item_sample.png'), filename: 'item_sample.png')
    end
  end
end

#--------------------以下、保留--------------------------------------

#     title               { Faker::Lorem.sentence }
#     detail              { Faker::Lorem.sentence }
#     category_id         { Faker::Number.between(from: 2, to: 11) }
#     quality_id          { Faker::Number.between(from: 2, to: 7) }
#     postage_id          { Faker::Number.between(from: 2, to: 3) }
#     prefecture_id       { Faker::Number.between(from: 2, to: 48) }
#     shipment_date_id    {2}
#     price               { Faker::Number.between(from: 300, to: 9999999) }
