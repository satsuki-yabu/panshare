class ToppagesController < ApplicationController
  def index
    if logged_in?
      @article = current_user.articles.build  # form_with 用
      @articles = current_user.articles.order(id: :desc).page(params[:page])
    end
  end
end
