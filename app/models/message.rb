class Message < ApplicationRecord
  belongs_to :private_chat
  belongs_to :user
end
