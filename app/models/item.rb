class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_one :order
  has_many :comments

  with_options presence: true do
    validates :name
    validates :info
    validates :images, presence: {message: 'が添付されていません'}
  end

  with_options numericality: { other_than: 1, message: 'が選択されていません' } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  validates :price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
end
