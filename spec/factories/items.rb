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
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end