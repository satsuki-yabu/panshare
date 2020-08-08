class ArticlesController < ApplicationController
   before_action :require_user_logged_in
   before_action :correct_user, only: [:destroy]

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_path
    else
      @articles = current_user.articles.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end
  
  def destroy
    @article.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
  
  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    unless @article
      redirect_to root_url
    end
  end
end