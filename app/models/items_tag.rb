class ItemsTag

  include ActiveModel::Model
  attr_accessor :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :user_id, :title, :images

  with_options presence: true do
    validates :name
    validates :info
    validates :images, presence: {message: 'が添付されていません'}
    validates :title
  end

  with_options numericality: { other_than: 1, message: 'が選択されていません' } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  validates :price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }

  def save
    item = Item.create(images: images, name: name, info: info, category_id: category_id, sales_status_id: sales_status_id, shipping_fee_status_id: shipping_fee_status_id, prefecture_id: prefecture_id, scheduled_delivery_id: scheduled_delivery_id, price: price, user_id: user_id)
  
    tag = Tag.create(title: title)

    TweetTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

end