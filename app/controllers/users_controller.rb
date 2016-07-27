class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :following, :followers,
  :like_microposts]
    
  def show
    # @user = User.find(params[:id]) <= before_actionで設定しているので不要
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Micropostへようこそ！"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    # ログインユーザー以外ならshowへ遷移
    if current_user != @user
      flash[:danger] = "本人以外はプロフィールを変更できません"
      redirect_to @user
    end
  end
    
  def update
    if @user.update(user_params)
      flash[:success] = "プロフィールを変更しました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def following
    @title = "フォローユーザー"
    @users = @user.following_users
    render 'followings_followers'
  end
  
  def followers
    @title = "フォロワー"
    @users = @user.follower_users
    render 'followings_followers'
  end
  
  def like_microposts
    @microposts = @user.like_microposts
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
