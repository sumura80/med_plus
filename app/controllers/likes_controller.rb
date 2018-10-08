class LikesController < ApplicationController
	def create
    @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
    @likes = Like.where(post_id: params[:post_id])
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params[:post_id])
    @like.destroy
    @likes = Like.where(post_id: params[:post_id])
  end

end
