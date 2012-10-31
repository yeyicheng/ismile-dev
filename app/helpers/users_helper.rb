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
end
