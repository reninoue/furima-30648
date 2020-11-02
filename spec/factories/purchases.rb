FactoryBot.define do
  factory :user_purchase do
    post_code          { '151-0072' }
    prefectures_id     { 1 }
    city               { '渋谷区' }
    block_number       { '1-1' }
    phone_number       { '08077776666' }
    user_id            { 1 }
    item_id            { 1 }
    token              {"tok_abcdefghijk00000000000000000"}
  end
end
