class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image_url
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :categorie
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :delivery_days

  with_options presence: true do
   validates :image_url
   validates :name, length: { maximum: 40 }
   validates :explanation, length: { maximum: 1000 }
   validates :categorie_id, numericality: { other_than: 1 }
   validates :condition_id, numericality: { other_than: 1 }
   validates :shipping_charge_id, numericality: { other_than: 1 }
   validates :shipping_region_id, numericality: { other_than: 1 }
   validates :delivery_days_id, numericality: { other_than: 1 }
   validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
end
