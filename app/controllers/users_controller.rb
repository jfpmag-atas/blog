class UsersController < ApplicationController
	def sign_in
		@user = User.new
	end

	def sign_out
		session[:user_id] = nil

		redirect_to welcome_index_path, :notice => "You are now sign out. See you again later!"
	end

	def login
	  @user = User.find_by_username(user_params[:username])
	  if @user && @user.authenticate(user_params[:password])
	    session[:user_id] = @user.id
	    session[:initial_login] = "Y"
	    redirect_to welcome_index_path
	  else
			redirect_to :back, :notice => "Invalid email or password"
		end
	end

	def sign_up
		@user = User.new
	end

	def new
		@user = User.find_by_email(user_params[:email])
		# @user = User.new(user_params)

		if User.find_by_username(user_params[:username])
			redirect_to :back, :notice => "Username already exists."
		elsif User.find_by_email(user_params[:email])
			redirect_to :back, :notice => "Email already exists."
		else
			@user = User.new(user_params)

			@user.save
			session[:user_id] = @user.id
			session[:initial_login] = "Y"
			redirect_to welcome_index_path 
		end
	end

	private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end