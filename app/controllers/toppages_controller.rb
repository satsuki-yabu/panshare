class ToppagesController < ApplicationController
  def index
      @articles = Article.all  
      @articles = @articles.page(params[:page]).per(8)
  end
end
