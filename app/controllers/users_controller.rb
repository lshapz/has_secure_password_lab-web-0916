class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    #binding.pry
    if params[:password] != params[:confirm_password]
      redirect_to new_user_path
    end 
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_user_path
    end
          #redirect_to new_user_path

  end 

  def show
  #  binding.pry
    @user = User.find(params[:id])
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :confirm_password, :id)

  end 
end
