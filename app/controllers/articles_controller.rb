class ArticlesController < ApplicationController
	before_filter :logged_in

  def new
  	@article 	= Article.new
  	@tags			= Array.new
  	@tag 			= Tag.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = session[:user_id]
    session[:initial_login] = "N"

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
    @user = User.find(@article.user_id)
    @tag = Tag.new
  end

  def index
  	session[:initial_login] = "N"
    @user_articles = Article.where(user_id: session[:user_id])
    @other_articles = Article.where.not(user_id: session[:user_id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
