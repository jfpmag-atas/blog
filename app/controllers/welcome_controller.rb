class WelcomeController < ApplicationController
  def index
  	if session[:user_id]
  		redirect_to articles_path
  	else
  		@articles = Article.all
  	end
  end
end