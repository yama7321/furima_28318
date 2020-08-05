FactoryBot.define do
  factory :product_order do
    postal_code { '123-4567' }
    city { '渋谷区' }
    house_number { '神南１丁目１８−２' }
    building_number { 'フレーム神南坂 4階' }
    phone_number { '00000000000' }
    prefecture_id { 2 }
    token { 'tok_abcdefghijklmnop1234567890' }
    user_id { 1 }
    product_id { 1 }
  end
end
