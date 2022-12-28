class ChatroomsController < ApplicationController
  def new
    @chatroom = Chatroom.new
  end
  
  def create
    @chatroom = Chatroom.new(chatroom_params)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
