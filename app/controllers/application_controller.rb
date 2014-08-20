class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    # Note: we want to use "find_by_id" because it's OK to return a nil.
    # If we were to use User.find, it would throw an exception if the user can't be found.
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in
  	unless session[:user_id]
  		flash[:notice] = "Log in is required. Please log in or sign up."
      redirect_to sign_in_path
      return false
  	else
  		return true
  	end
  end
end