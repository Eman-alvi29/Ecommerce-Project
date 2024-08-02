class Item < ApplicationRecord
  include Ransackable
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :item_sizes
  has_many :sizes, through: :item_sizes

  has_one_attached :image
  scope :with_image, -> { joins(image_attachment: :blob) }

end
