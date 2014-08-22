class TagsController < ApplicationController
	def create
		@tag = Tag.new
		@tags = Array.new
	end

	def add
		@tag = Tag.new(tag_params)
		@article = Article.find(article_params[:article_id])

		@tag.articles << @article
		@tag.save

		redirect_to :back
	end

	def tagged_articles
		@tag = Tag.find(params[:id])
		render :template => "tags/tagged_articles"
	end

	private
    def tag_params
      params.require(:tag).permit(:name)
    end

    def article_params
      params.require(:tag).permit(:article_id)
    end
end