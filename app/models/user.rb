# app/models/user.rb
class User < ApplicationRecord
  # Avatar attachment using Active Storage
  has_one_attached :avatar

  # Additional fields for user profile
  validates :name, presence: true
  validates :bio, length: { maximum: 500 }
  validates :website, format: { with: URI::DEFAULT_PARSER.make_regexp, message: "Invalid URL format" }, allow_blank: true
  validates :gender, inclusion: { in: ['male', 'female', 'other'], allow_blank: true }

  # Devise modules for authentication
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :friendships, foreign_key: :sender_id
  has_many :followers, foreign_key: :follower_id
end
