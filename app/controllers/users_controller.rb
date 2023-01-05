class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all_except(current_user)

    @chatroom = Chatroom.new
    @chatrooms = Chatrooms.all
    @chatroom_name = get_name(@user, current_user)

    def show
      @user = User.find(params[:id])
      @current_user = current_user
      @rooms = Chatroom.public_rooms
      @users = User.all_except(@current_user)
      @room = Chatroom.new
      @message = Message.new
      @room_name = get_name(@user, @current_user)
      @single_room = Chatroom.where(name: @room_name).first || Room.create_private_room([@user, @current_user], @room_name)
      @messages = @single_room.messages

      render "chatrooms/show"
  end

  private

  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end

end
