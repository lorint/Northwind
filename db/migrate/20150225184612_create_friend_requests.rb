class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.integer :friender_id
      t.integer :friendee_id

      t.timestamps
    end
  end
end
