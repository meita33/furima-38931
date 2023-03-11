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
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
  validates :price, numericality: true

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :quality_id
    validates :postage_id
    validates :prefecture_id
    validates :shipment_date_id
  end
end
