class User < ApplicationRecord
  include Ransackable

  has_one_attached :profile_image
  has_many :orders

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
