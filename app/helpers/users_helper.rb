module UsersHelper
	def current_user
		if session[:user_id]
			User.find(session[:user_id])
		else 
			nil
		end
	end

	def correct_user? (user)
		user == current_user
	end

	def is_admin?
		redirect_to sessions_new_path unless current_user && current_user.admin?
	end
end
