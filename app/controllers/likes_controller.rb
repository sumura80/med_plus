class LikesController < ApplicationController
	def create
    like = Like.create(user_id: current_user.id, post_id: params[:post_id])
    @post = like.post
  end

  def destroy
    like = current_user.likes.find_by(post_id: params[:post_id])
    @post =like.post
    like.destroy
  end
end
