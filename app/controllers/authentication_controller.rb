class AuthenticationController < ApplicationController
  def sign_in
    @user = User.new
  end

  def login
    username_or_email = params[:user][:username]
    password = params[:user][:password]

    if username_or_email.rindex('@')
      email=username_or_email
      user = User.authenticate_by_email(email, password)
    else
      username=username_or_email
      user = User.authenticate_by_username(username, password)
    end

    if user
    	flash[:notice] = 'Welcome.'
      redirect_to :root
    else
    	flash.now[:error] = 'Unknown user. Please check your username and password.'
      render :action => "sign_in"
    end
  end

  def new_user
	  @user = User.new
	end

  def register
	  @user = User.new(user_params)

	  if @user.valid?
	    @user.save
	    session[:user_id] = @user.id
	    flash[:notice] = 'Welcome.'
	    redirect_to :root
	  else
	    render :action => "new_user"
	  end
	end

	def signed_out
	  session[:user_id] = nil
	  flash[:notice] = "You have been signed out."
	  redirect_to :root
	end

	private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end