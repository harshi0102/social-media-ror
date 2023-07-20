# app/models/notification.rb
class Notification < ApplicationRecord
    # Associations
    belongs_to :user
    belongs_to :sender, class_name: 'User'
    belongs_to :notifiable, polymorphic: true
  
    # Scopes to filter notifications
    scope :unread, -> { where(read: false) }
    scope :friend_requests, -> { where(notification_type: 'friend_request') }
    scope :comments, -> { where(notification_type: 'comment') }
    scope :likes, -> { where(notification_type: 'like') }
  
    # Method to mark notification as read
    def mark_as_read!
      update(read: true)
    end
  
    # Method to check if the notification is a friend request
    def friend_request?
      notification_type == 'friend_request'
    end
  
    # Method to check if the notification is a comment
    def comment?
      notification_type == 'comment'
    end
  
    # Method to check if the notification is a post like
    def like?
      notification_type == 'like'
    end
  end
  