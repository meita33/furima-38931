class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image
  belongs_to_active_hash :prefecture


  validates :
  validates :
  validates :

  validates :category_id
  validates :quality_id
  validates :shipping_fee_id
  validates :prefecture_id
  validates :shipment_date_id


end
