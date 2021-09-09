class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  mount_uploader :illustration, ImageUploader
  validates :illustration, presence: true
  validates :description, presence: true, length: {minimun:1, maximum: 140}
end
