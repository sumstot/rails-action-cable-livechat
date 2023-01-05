class UsersController < ApplicationController
  def show
    @users = @users = User.all_except(@current_user)
    @user = User.find(params[:id])
    @current_user = current_user
    @rooms = Chatroom.public_rooms
    @users = User.all_except(@current_user)
    @room = Chatroom.new
    @message = Message.new
    @room_name = get_name(@user, @current_user)
    @chatroom = Chatroom.where(name: @room_name).first || Chatroom.make_private_room([@user, @current_user], @room_name)
    @messages = @chatroom.messages

    render "chatrooms/show"
  end

  private

  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end

end
