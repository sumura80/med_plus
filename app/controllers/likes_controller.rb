class LikesController < ApplicationController
	def create
    # @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
    # @likes = Like.where(post_id: params[:post_id])

    # create.js.erbにpost情報を渡したいためインスタンス変数を利用。
    like = Like.create(user_id: current_user.id, post_id: params[:post_id])
    @post = like.post
  end

  def destroy
    # @like = current_user.likes.find_by(post_id: params[:post_id])
    # @like.destroy
    # @likes = Like.where(post_id: params[:post_id])

    # createアクションと同様の理由でインスタンス変数を利用。
    like = current_user.likes.find_by(post_id: params[:post_id])
    @post =like.post
    like.destroy
  end

end
