class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all_except(current_user)

    @chatroom = Chatroom.new
    @chatrooms = Chatrooms.all
    @chatroom_name = get_name(@user, current_user)
  end

  private

  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end

end
