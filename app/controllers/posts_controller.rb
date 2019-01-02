class PostsController < ApplicationController
	before_action :find_post ,only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except:[:index, :show]

	def index
		if params[:category].blank?
    		@posts = Post.all.order("created_at DESC")
    	else
			@category_id = Category.find_by(name: params[:category]).id
			@posts = Post.where(:category_id => @category_id)
		end
	end

	def show
		@post = Post.find_by(id: params[:id])
		#showでは@postしか使わなかったのでほかを削除
    	#@likes = Like.where(prototype_id: params[:id])
    	@comments_by_votes = @post.comments.order_by_voute_count
	end

	def new
		#@post = Post.new
		@post = current_user.posts.build
		@categories = Category.all.map{ |c| [c.name, c.id]}
	end

	def create
		_params = post_params
		translate_description = Post.auto_translate(text: _params['description'])
		hash_description = { ja: _params['description'],
							en: translate_description['resultset']['result']['text'] }
		_params['description'] = hash_description
		@post = current_user.posts.build(_params)
		@post.category_id = params[:category_id]
		if @post.save
			redirect_to @post
		else
			render 'edit'
		end
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id]}
	end

	def update
		@post.category_id = params[:category_id]

		if @post.update(post_params)
			redirect_to post_path
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	private
	def post_params
		params.require(:post).permit(:id, :title, :description, :image, :category_id, :category_id)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
