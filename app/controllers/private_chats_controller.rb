class PrivateChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_private_chat, only: [:show]

  def index
    if current_user
      @user = current_user
      @private_chats = PrivateChat.where("user1_id = ? OR user2_id = ?", @user.id, @user.id).order("created_at DESC")
    else
      redirect_to new_user_session_path, notice: "Please log in first."
    end
  end

  def show
    @user = current_user
    @private_chat = PrivateChat.find(params[:id])
    @message = Message.new
  end

  private

  def find_private_chat
    @private_chat = PrivateChat.find(params[:id])
  end

  def private_chat_params
    params.require(:private_chat).permit(:user1_id, :user2_id)
  end

end