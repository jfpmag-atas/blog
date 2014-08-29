class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  def reply
  	@comment = Comment.find(params[:id])
  	@reply = Comment.new
  	respond_to do |format|
  		format.js
  	end
  end

  def add_reply
  	@comment = Comment.find(params[:comment_id])
  	@article = Article.find(@comment.article_id)

  	@reply = Comment.new(comment_params)
  	@comment.replies << @reply

  	if @reply.save
  		@comment.save
  	end

  	redirect_to article_path(@article)  	
  end

  def delete_reply
  	@comment = Comment.find(params[:comment_id])
  	@article = Article.find(@comment.article_id)
  	@reply = Comment.find(params[:reply_id])

  	@reply.destroy
  	redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
