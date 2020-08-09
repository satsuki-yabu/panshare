class ToppagesController < ApplicationController
  def index
      @articles = Article.all  
      @articles = @articles.page(params[:page])
  end
end
