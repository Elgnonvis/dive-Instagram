class User < ApplicationRecord

    has_many :posts
    has_many :favorites, dependent: :destroy
    has_many :favorite_posts, through: :favorites, source: :post
    
    mount_uploader :avatar, ImageUploader

    validates :username, presence: true,
    uniqueness: { case_sensitive: false},
    length: {minimum:6, maximum:20},
    format: { with: /\A[a-zA-Z0-9_]{6,20}\z/, message: 'ne doit contenir que des caractères alphanumériques ou undescore' }
    validates :name, presence: true, length: {maximum: 30}
    validates :email, presence: true,
    uniqueness: { case_sensitive: false},
    length: {maximum: 255},
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, presence: true,
    length: {minimum: 8}
    
    has_secure_password
end
