class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image_url
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :categorie
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :delivery_days

  validates :categorie_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
  validates :shipping_region_id, numericality: { other_than: 1 } 
  validates :delivery_days_id, numericality: { other_than: 1 }
  validates :image_url, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true,
            length: { minimum: 300, maximum: 9999999999 }
end
