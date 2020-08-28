class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image_url
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :categorie
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :delivery_days

  validates :image_url, presence: true
  validates :name, presence: true,
                   length: { maximum: 40 }
  validates :explanation, presence: true,
                          length: { maximum: 1000 }
  validates :categorie_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :shipping_region_id, numericality: { other_than: 1 }
  validates :delivery_days_id, numericality: { other_than: 1 }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300 },
                    numericality: { less_than_or_equal_to: 9_999_999 }
end
