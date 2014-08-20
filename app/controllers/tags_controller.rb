class TagsController < ApplicationController
	def create
		@tag = Tag.new
		@tags = Array.new
	end

	def add
		@tag = Tag.new(tag_params)
		@tag.save
		
		redirect_to :back
	end

	private
    def tag_params
      params.require(:tag).permit(:name, {:article_id => [:id, :title, :text]})
    end
end