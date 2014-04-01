class WelcomeController < ApplicationController
	def index
		if current_user && current_user.user_type == "admin"
			redirect_to admin_path
		elsif current_user && current_user.user_type == "student"
			redirect_to user_path(current_user)
		end
	end
end
