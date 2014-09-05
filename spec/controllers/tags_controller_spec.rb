require 'rails_helper'
require 'spec_helper'

describe TagsController, :type => :controller do
	describe "adding new tags" do
		before(:each) do
			request.env["HTTP_REFERER"] = "/articles/show"
		end

		it "creates new tag" do
			post :add, tag: {name: "testTag", article_id: 1}

			expect(assigns(:tag)).not_to be_nil
			expect(assigns(:article)).not_to be_nil

			expect(assigns(:tag).articles).not_to be_empty
			expect(assigns(:tag).articles.size).to eq(1)
			should redirect_to "/articles/show"
		end
	end

	describe "tagged article" do
		it "fetches articles tagged" do
			post :tagged_articles, id: 1

			expect(assigns(:tag)).not_to be_nil
			expect(assigns(:tag).articles).not_to be_empty
			expect(assigns(:tag).articles.size).to eq(1)

			should render_template "tags/tagged_articles"
		end
	end
end
