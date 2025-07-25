class PrivateChatChannel < ApplicationCable::Channel
  def subscribed
    if params[:id].present?
      @private_chat = PrivateChat.find(params[:id])
    end

    stream_for @private_chat
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
