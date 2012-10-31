class UsersController < ApplicationController
	# GET /users/1
	# GET /users/1.xml
	def show
		@title = 'User'
		@user = User.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.xml  { render :xml => @user }
		end
	end

	# GET /users/new
	# GET /users/new.xml
	def new
		@title = 'Welcome'
		@user = User.new

		respond_to do |format|
			format.html # new.html.erb
			format.xml  { render :xml => @user }
		end
	end

	# GET /users/1/edit
	def edit
		@title = 'User'
		if current_user && correct_user?(current_user)
			@user = User.find(params[:id])
		else
			redirect_to store_path, notice: "Sorry, you don't have the permission"
		end
	end

	# POST /users
	# POST /users.xml
	def create
		@user = User.new(params[:user])

		respond_to do |format|
			if @user.save
				session[:user_id] = @user.id
				format.html { redirect_to(users_show_path(@user.id), :notice => "User #{@user.username} was successfully created.") }
				format.xml  { render :xml => @user, :status => :created, :location => @user }
			else
				format.html { render :action => "new" }
				format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
			end
		end
	end

	# PUT /users/1
	# PUT /users/1.xml
	def update
		if !correct_user? current_user
			redirect_to store_path, notice: "Sorry, you don't have the permission."
		end
		@user = User.find(params[:id])

		respond_to do |format|
			if @user.update_attributes(params[:user])
				format.html { redirect_to(@user, :notice => "User #{@user.username} was successfully updated.") }
				format.xml  { head :ok }
			else
				format.html { render :action => "edit" }
				format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
			end
		end
	end

	# DELETE /users/1
	# DELETE /users/1.xml
	def destroy
		@user = User.find(params[:id])
		@user.destroy

		respond_to do |format|
			format.html { redirect_to(root_path) }
			format.xml  { head :ok }
		end
	end
end
