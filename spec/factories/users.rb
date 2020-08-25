FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { '安井' }
    first_name            { '英史' }
    family_name_kana      { 'ヤスイ' }
    first_name_kana       { 'ヒデフミ' }
    birthday              { '20200304' }
  end
end
