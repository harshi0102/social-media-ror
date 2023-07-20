class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sender, null: false, foreign_key: { to_table: :users }
      t.references :notifiable, polymorphic: true
      t.string :notification_type
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
