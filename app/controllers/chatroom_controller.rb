class ChatroomController < ApplicationController
  def index
    @messages = Message.includes(:user).last(50)
  end
end
