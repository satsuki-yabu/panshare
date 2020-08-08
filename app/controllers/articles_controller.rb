class ArticlesController < ApplicationController
   before_action :require_user_logged_in

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @articles = current_user.articles.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end
  
  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:text).permit(:content)
  end
end