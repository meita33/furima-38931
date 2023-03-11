class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :quality
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipment_date

  with_options presence: true do
    validates :image
    validates :title,   length: { maximum: 40 }
    validates :detail,  length: { maximum: 1000 }
    validates :price,   numericality: {only_integer: true, message: 'Half-width number'}
    validates :price,   numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :quality_id
    validates :postage_id
    validates :prefecture_id
    validates :shipment_date_id
  end
end
