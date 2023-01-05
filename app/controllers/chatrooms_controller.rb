class ChatroomsController < ApplicationController
  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render 'chatrooms/show', status: :unprocessable_entity
    end
  end

  def show
    @current_user = current_user
    @users = User.all_except(@current_user)
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def destroy
    @chatroom = Chatroom.find([params[:id]])
    @chatroom.destroy
    redirect_to chatrooms_path(@chatroom)
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
