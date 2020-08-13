class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
 has_secure_password
 
 has_many :articles
 has_many :favorites, dependent: :destroy
 has_many :fav_articles, through: :favorites, source: :article
 
def favorite(article)
    favorites.find_or_create_by(article_id: article.id)
  end 
    
  def unfavorite(article)
    favorite = favorites.find_by(article_id: article.id)
    favorite.destroy if favorite
  end
  
  def favorites?(article)
  self.fav_articles.include?(article)
  end
end
