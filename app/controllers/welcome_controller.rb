class WelcomeController < ApplicationController
  def index
  	if session[:user_id]
  		redirect_to articles_path
  	else
  		@articles = Article.all
  		@tags = Tag.all
  	end
  end
end