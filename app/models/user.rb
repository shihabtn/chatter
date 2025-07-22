class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add additional user fields and associations here
  validates :username, presence: true, uniqueness: true



  # Chat associations
  has_many :private_chats_as_user1, class_name: "PrivateChat", foreign_key: "user1_id", dependent: :destroy
  has_many :private_chats_as_user2, class_name: "PrivateChat", foreign_key: "user2_id", dependent: :destroy
  has_many :messages, dependent: :destroy
end
