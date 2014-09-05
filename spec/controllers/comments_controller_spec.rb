require 'rails_helper'
require 'spec_helper'

describe CommentsController, :type => :controller do
	describe "adding comment to article" do
		it "adds comment to an article" do
			post :create, comment: {commenter: "commentor", body: "test comment"}, article_id: 1

			expect(assigns(:article)).not_to be_nil
			expect(assigns(:comment)).not_to be_nil

			should redirect_to article_path(assigns(:article))
		end
	end

	describe "adding reply to comment" do
		it "adds reply to a comment" do
			post :add_reply, comment: {commenter: "replier", body: "test reply"}, comment_id: 1

			expect(assigns(:comment)).not_to be_nil
			expect(assigns(:article)).not_to be_nil
			expect(assigns(:reply)).not_to be_nil

			expect(assigns(:comment).replies).not_to be_empty
			expect(assigns(:comment).replies.size).to eq(1)
			expect(assigns(:comment).replies[0]) == assigns(:reply)

			should redirect_to article_path(assigns(:article))
		end
	end

	describe "deleting a reply" do
		it "removing a reply from comment" do
			post :delete_reply, reply_id: 1, comment_id: 1

			expect(assigns(:comment)).not_to be_nil
			expect(assigns(:comment).replies).to be_empty

			should redirect_to article_path(assigns(:article))
		end
	end
end
