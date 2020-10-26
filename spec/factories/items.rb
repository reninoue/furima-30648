FactoryBot.define do
  factory :item do
    name              { '名前' }
    description       { '説明' }
    image             { Faker::Lorem.sentence }
    category_id       {2}
    condition_id      {2}
    postage_payer_id  {2}
    prefecture_id     {2}
    handling_time_id  {2}
    price             {1111}
    user              { FactoryBot.create(:user) }
  end
end
