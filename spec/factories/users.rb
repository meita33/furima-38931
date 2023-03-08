FactoryBot.define do
  factory :user do
    nick_name             { "human" }
    email                 { "hoge@example" }
    password              { "a1a1a1" }
    password_confirmation { password }
    first_name_kanji      { "一郎" }
    last_name_kanji       { "佐藤" }
    first_name_kana       { "イチロウ" }
    last_name_kana        { "サトウ" }
    birthday              { Faker::Date.birthday }
  end
end