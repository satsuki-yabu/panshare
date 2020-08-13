class ArticlesController < ApplicationController
   before_action :require_user_logged_in
   skip_before_action :require_user_logged_in, only: [:show]
   before_action :correct_user, only: [:edit, :update, :destroy]
   
   
  def new
   @article = current_user.articles.build
  end
  

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_path
    else
      @articles = current_user.articles.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'articles/new'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def edit
    @article = Article.find_by(id: params[:id])
  end
  
  def update
    @article = Article.find_by(id: params[:id])
    if @article.update(article_params)
      flash[:success] = 'メッセージを編集しました'
      redirect_to user_path(current_user)
    else
      flash[:success] = 'メッセージの編集に失敗しました'
      render "edit"
    end
  end
  
  
  
  def destroy
    @article.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :img)
  end
  
  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    unless @article
      redirect_to root_url
    end
  end
end