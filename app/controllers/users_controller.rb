class UsersController < ApplicationController

	def index
		@users = User.paginate(page: params[:page])
	end

	def show
		@user = User.find(params[:id])
		@orders = Order.where(user_id: params[:id])
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted"
		redirect_to users_url
	end
	
end
