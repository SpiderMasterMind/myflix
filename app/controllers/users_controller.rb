class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(message_params)
		if @user.save
			redirect_to sign_in_path
		else
			render 'new'
		end
	end

	def message_params
		params.require(:user).permit(:email, :password, :full_name)
	end
end
