class UsersController < ApplicationController
	before_action :authenticate_user!, only:[:show, :edit,:update]

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "Your image was successfully updated"
			redirect_to user_path
		else
			render 'edit'
		end
	end

	private
  def user_params
  	params.require(:user).permit(:user_image)
  end


end
