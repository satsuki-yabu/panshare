class FavoritesController < ApplicationController
   before_action :require_user_logged_in
   
  def create
    article = Article.find(params[:article_id])
    current_user.favorite(article)
    flash[:success] = "お気に入り登録が完了しました"
    redirect_back(fallback_location: root_path)
  end  

  def destroy
    article = Article.find(params[:article_id])
    current_user.unfavorite(article)
    flash[:success] = "お気に入り登録を解除しました"
    redirect_back(fallback_location: root_path)
  end
end
