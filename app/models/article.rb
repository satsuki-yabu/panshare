class Article < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true, length: { maximum: 255 }
  
  has_many :user, through: :favorites, source: :user
  
end
