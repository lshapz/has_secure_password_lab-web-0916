require 'pry'
class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def edit
  end
  def create
    #binding.pry
    user = User.find_by(name: params[:name])
    if user == nil
      redirect_to new_user_path
    else
      user = user.authenticate(params[:password])
      if user == nil
    # binding.pry      
      redirect_to new_user_path
      else
        session[:user_id] = user.id
        #binding.pry
        redirect_to user_path(user)
      end
    end 
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end 
end
