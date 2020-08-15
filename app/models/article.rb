class Article < ApplicationRecord 
  belongs_to :user
  
  mount_uploader :img, ImgUploader
  
  has_many :favorites, foreign_key: "article_id", dependent: :destroy
  has_many :users, through: :favorites, source: :user
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true, length: { maximum: 255 }
  validate  :img_size
  
  private
  
    def img_size
      if img.size > 5.megabytes
        errors.add(:img, "should be less than 5MB")
      end
    end
end
