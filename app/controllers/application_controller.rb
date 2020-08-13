class ApplicationController < ActionController::Base
 
  include SessionsHelper
 
 private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_articles = user.articles.count
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end
end
