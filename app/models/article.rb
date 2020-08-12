class Article < ApplicationRecord 
  belongs_to :user
  
  mount_uploader :img, ImgUploader
  
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true, length: { maximum: 255 }
  
  has_many :users, through: :favorites, source: :user
  

  
end
