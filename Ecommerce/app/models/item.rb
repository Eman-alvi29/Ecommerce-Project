class Item < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :item_sizes
  has_many :sizes, through: :item_sizes

  has_one_attached :image  # Ensure this line is included
  scope :with_image, -> { joins(image_attachment: :blob) }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "price", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "item_sizes", "order_items", "orders", "sizes", "image"]
  end
end
