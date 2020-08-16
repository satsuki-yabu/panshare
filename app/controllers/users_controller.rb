class UsersController < ApplicationController
   before_action :require_user_logged_in, only: [:show, :likes]

  def show
    @user = current_user
    @articles = @user.articles.order(id: :desc).page(params[:page]).per(5)
    counts(@user)
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def likes
    @user = current_user
    @articles = @user.fav_articles.order(id: :desc).page(params[:page]).per(5)
    counts(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
