class CreatePrivateChats < ActiveRecord::Migration[8.0]
  def change
    create_table :private_chats do |t|
      t.references :profile1, null: false, foreign_key: true
      t.references :profile2, null: false, foreign_key: true

      t.timestamps
    end
  end
end
