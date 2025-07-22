class RefactorProfileToUser < ActiveRecord::Migration[7.1]
  def change
    # Remove existing foreign keys
    remove_foreign_key :messages, :profiles, column: :profile_id
    remove_foreign_key :private_chats, :profiles, column: :profile1_id
    remove_foreign_key :private_chats, :profiles, column: :profile2_id

    # Rename columns in messages
    rename_column :messages, :profile_id, :user_id

    # Rename columns in private_chats
    rename_column :private_chats, :profile1_id, :user1_id
    rename_column :private_chats, :profile2_id, :user2_id

    # Add new foreign keys referencing users
    add_foreign_key :messages, :users
    add_foreign_key :private_chats, :users, column: :user1_id
    add_foreign_key :private_chats, :users, column: :user2_id

    # Drop the profiles table
    drop_table :profiles
  end
end
