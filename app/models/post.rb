class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  mount_uploader :illustration, ImageUploader
  validates :illustration, presence: true
  validates :description, presence: true
end
