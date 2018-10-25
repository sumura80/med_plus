class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :votes
  # has_many :votes, dependent: :destroy	
  #ユーザーがアカウントを削除してもコメントは残したい

 def vote_user(user)
   votes.find_by(user_id: user)
  end
end
