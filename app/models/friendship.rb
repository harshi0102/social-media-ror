# app/models/friendship.rb
class Friendship < ApplicationRecord
  # Associations
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  # Validations to prevent duplicate friendships
  validates :sender_id, uniqueness: { scope: :receiver_id }
end
