FactoryBot.define do
  factory :user do
    nick_name             { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name_kanji      { Faker::Name }
    last_name_kanji       { Faker::Name }
    first_name_kana       { "イチロウ" }
    last_name_kana        { "サトウ" }
    birthday            { Faker::Date.birthday }
  end
end