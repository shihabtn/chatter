class PrivateChat < ApplicationRecord
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"
  has_many :messages, dependent: :destroy

  def self.get_private_chat(user1_id, user2_id)
    where(
      "(user1_id = :user1_id AND user2_id = :user2_id) OR
      (user1_id = :user2_id AND user2_id = :user1_id)",
      user1_id: user1_id, user2_id: user2_id,
      ).first
  end
end
