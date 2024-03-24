class ChatroomController < ApplicationController
  def index
    @messages = Message.includes(:user).last(50)
  end

  def create_message
    @message = Message.new(message_params)
    @message.user_id = 1
    @message.save
  end

  def message_params
  params.require(:message).permit(:content)
  end

end
