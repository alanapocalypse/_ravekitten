class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def edit
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sessions[:user_id] = @user.id
			redirect_to root_url, notice: "Thanks for signing up!"
		else
			render "new"
		end
	end

	def update
	end

	def destroy
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
	
end
