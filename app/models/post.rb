class Post < ApplicationRecord
  # Image attachment using Active Storage (optional)
  has_one_attached :image

  # Content should be present and limited to a maximum of 280 characters
  validates :content, presence: true, length: { maximum: 280 }

  # Associations
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # Method to fetch posts from friends and followed users
  def self.newsfeed_for_user(user)
    friend_ids = user.friends.pluck(:id)
    followed_user_ids = user.followed_users.pluck(:id)
    all_ids = friend_ids + followed_user_ids + [user.id]
    Post.where(user_id: all_ids).order(created_at: :desc)
  end
end
