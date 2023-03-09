class Item < ApplicationRecord
  validates :
  validates :
  validates :

  validates :category_id
  validates :quality_id
  validates :shipping_fee_id
  validates :prefecture_id
  validates :shipment_date_id

  has_one_attached :image
end
