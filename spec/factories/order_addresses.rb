FactoryBot.define do
  factory :order_address do
    token            { 'tok_abcdefghijk00000000000000000' }
    post_code        { '123-4567' }
    prefecture_id    { Faker::Number.between(from: 2, to: 48) }
    city             { Gimei.city.kanji }
    block            { Gimei.town.kanji }
    building         { '建物名' }
    phone_number     { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
  end
end
