class ItemSize < ApplicationRecord
  include Ransackable
  belongs_to :item
  belongs_to :size
end
