class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts  
  has_many :comments
  has_many :likes
  has_many :votes
  mount_uploader :user_image, ImageUploader
  
 #↓論理削除をするためのparanoiaの導入
  acts_as_paranoid
  

end
