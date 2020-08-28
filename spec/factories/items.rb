FactoryBot.define do
  factory :item do
    image_url          { 'test_image.png' }
    name               { 'nice item' }
    explanation        { 'so cool' }
    categorie_id       { '2' }
    condition_id       { '2' }
    shipping_charge_id { '3' }
    shipping_region_id { '3' }
    delivery_days_id   { '2' }
    price              { '3000' }
    user_id            { '3' }
  end
end
