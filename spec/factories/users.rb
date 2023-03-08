FactoryBot.define do
  factory :user do
    nick_name             { 'human' }
    email                 { Faker::Internet.free_email }
    password              { 'a1a1a1' }
    password_confirmation { password }
    first_name_kanji      { '一郎' }
    last_name_kanji       { '佐藤' }
    first_name_kana       { 'イチロウ' }
    last_name_kana        { 'サトウ' }
    birthday              { Faker::Date.birthday }
  end
end

#---------------------以下保留----------------------

# FactoryBot.define do
#   factory :user do
#     nick_name             { "human" }
#     email                 { Faker::Internet.free_email }
#     password              { Faker::Internet.password(min_length: 6) }
#     password_confirmation { password }
#     first_name_kanji      { Faker::Name }
#     last_name_kanji       { Faker::Name }
#     first_name_kana       { "イチロウ" }
#     last_name_kana        { "サトウ" }
#     birthday            { Faker::Date.birthday }
#   end
# end

