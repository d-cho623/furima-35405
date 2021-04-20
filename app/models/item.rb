class Item < ApplicationRecord
  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, presence: true
  validates :sales_status_id, presence: true
  validates :shipping_fee_status_id, presence: true
  validates :prefecture_id, presence: true
  validates :scheduled_delivery_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
  # has_one :buy_info
end
