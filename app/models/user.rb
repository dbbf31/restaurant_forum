class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

  # 「使用者評論很多餐廳」的多對多關聯
  # 如果 User 已經有了評論，就不允許刪除帳號（刪除時拋出 Error）
  has_many :comments, dependent: :restrict_with_error
  has_many :restaurants, through: :comments

  # 「使用者收藏很多餐廳」的多對多關聯
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  # 「使用者喜愛很多餐廳」的多對多關聯
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  # 「使用者追蹤美食達人」的多對多關聯
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships
  
  # 「使用者的追蹤者」的設定
  # 透過 class_name, foreign_key 的自訂，指向 Followship 表上的另一側
  has_many :inverse_followships, class_name: "Followship", foreign_key: "following_id"
  has_many :followers, through: :inverse_followships, source: :user
  
  def admin?
    self.role == "admin"
  end

  def following?(user)
    self.followings.include?(user)
  end

  def follower?(user)
    self.followers.include?(user)
  end
  
end
