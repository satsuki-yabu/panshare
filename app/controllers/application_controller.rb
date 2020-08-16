class ApplicationController < ActionController::Base
 
  include SessionsHelper
 
 private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def counts(user)
    @count_articles = user.articles.count
    @count_favorites = user.fav_articles.count
  end
end
