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
   validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
   with_options numericality: { other_than: 1 } do
    validates :categorie_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_region_id
    validates :delivery_days_id
   end
  end
end
