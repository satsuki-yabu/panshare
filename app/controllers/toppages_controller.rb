class ToppagesController < ApplicationController
  def index
      @articles = Article.all  
      @articles = @articles.order(id: :desc).page(params[:page]).per(8)
  end
end
