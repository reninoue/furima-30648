FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '山田' }
    first_name_kana            { 'タロウ' }
    last_name_kana             { 'ヤマダ' }
    birth_date { '2020-01-01' }
  end
end
