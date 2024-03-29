require 'securerandom'

class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def new
    @user = User.new()
  end

  def user_params
    params.require(:user).permit(:username, :passhash)
  end
end
