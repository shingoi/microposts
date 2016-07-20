class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
    
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    # ログインユーザー以外ならshowへ遷移
    if current_user != @user
      flash[:danger] = "You can't change this account"
      redirect_to @user
    end
  end
    
  def update
    if @user.update(user_params)
      flash[:success] = "Your profile has been updated"
      redirect_to @user
    else
      redirect_to 'edit'
    end
  end
    
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, 
    :password_confirmation, :profile, :location)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
