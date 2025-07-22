class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :message ]

  def index
    @users = User.all
  end

  def show
  end

  def message
    if current_user == @user
      redirect_to user_path(@user.username), alert: "You cannot message yourself."
      return
    end

    # Find existing chat or create a new one
    @private_chat = PrivateChat.where("(user1_id = ? AND user2_id = ?) OR (user1_id = ? AND user2_id = ?)",
                                     current_user.id, @user.id, @user.id, current_user.id).first

    unless @private_chat
      @private_chat = PrivateChat.new
      @private_chat.user1_id = current_user.id
      @private_chat.user2_id = @user.id
      @private_chat.save
    end

    # Redirect to the chat page
    redirect_to user_private_chat_path(current_user, @private_chat)
  end

  private

  def set_user
    @user = User.find_by(username: params[:username])
    if @user.nil?
      redirect_to root_path, alert: "User not found"
      false
    end
  end
end
