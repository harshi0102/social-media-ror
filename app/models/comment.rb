# app/models/comment.rb
class Comment < ApplicationRecord
  # Content should be present and limited to a maximum of 280 characters
  validates :content, presence: true, length: { maximum: 280 }

  # Associations
  belongs_to :user
  belongs_to :post
end
