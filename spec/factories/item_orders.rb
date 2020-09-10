FactoryBot.define do
  factory :item_order do
    token { 'tok_8250d9313e27bef6f415722aabc7' }
    post_code { '110-0011' }
    prefecture_id { 24 }
    city { '台東区' }
    house_number { '三ノ輪1-1-1' }
    building_name { '' }
    phone_number { '08064962524' }
    item_id { '2' }
    user_id { '3' }
  end
end
