class FixPrivateChatsTable < ActiveRecord::Migration[8.0]
  def change
    # Drop the existing table
    drop_table :private_chats, if_exists: true

    # Create the table with correct references
    create_table :private_chats do |t|
      t.integer :profile1_id, null: false
      t.integer :profile2_id, null: false

      t.timestamps
    end

    # Add indexes
    add_index :private_chats, :profile1_id
    add_index :private_chats, :profile2_id

    # Add foreign keys
    add_foreign_key :private_chats, :profiles, column: :profile1_id
    add_foreign_key :private_chats, :profiles, column: :profile2_id
  end
end
