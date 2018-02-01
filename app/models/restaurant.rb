class Restaurant < ApplicationRecord
  validates_presence_of :name
  
  belongs_to :category

  # 當 Restaurant 物件被刪除時，順便刪除依賴的 Comment
  has_many :comments, dependent: :destroy

  mount_uploader :image, PhotoUploader
end
