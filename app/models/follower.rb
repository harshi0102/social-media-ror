# app/models/follower.rb
class Follower < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :follower, class_name: 'User'

  # Validations to prevent duplicate follower entries
  validates :user_id, uniqueness: { scope: :follower_id }
end
