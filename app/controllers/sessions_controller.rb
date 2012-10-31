class SessionsController < ApplicationController
	def new

	end

	def create
		if (params[:email].empty? || params[:pwd].empty?)
			redirect_to sessions_new_path, alert: 'Please enter account information.'
		elsif user = User.authenticate(params[:email], params[:pwd])
			session[:user_id] = user.id
			redirect_to root_path
		elsif user = User.find_by_email(params[:email])
			redirect_to sessions_new_path, alert: 'Invalid user/password conbination.'
		else
			redirect_to new_users_path, alert: 'Please sign up first.'				
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, :notice => "Logged out"
	end
end
