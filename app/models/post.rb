class Post < ApplicationRecord
	require 'json'
	require 'oauth'
	
	mount_uploader :image, ImageUploader
	belongs_to :user
	has_many :comments
	#has_many :likes
	has_many :likes, dependent: :destroy	
	belongs_to :category
	serialize :description
#    likes.find_by(user_id: user)
#   end
  #ここで定義されているlike_userというメソッドは、
  #そのユーザがアクセスしている投稿にlikeをしているかどうかというものを判定するもの。
  def like_user(user)
		likes.find_by(user_id: user)
  end

	def self.auto_translate(text:)
		consumer_key = 'consumer_key'
		consumer_secret = 'consumer_secret'
		url = 'リクエストurl'
		name = '登録名'
		text = text

		consumer = OAuth::Consumer.new(consumer_key, consumer_secret)
		endpoint = OAuth::AccessToken.new(consumer)

		response = endpoint.post(url,{key: consumer_key, type: 'json', name: name, text: text})
		@result = JSON.parse(response.body)
	end
end
