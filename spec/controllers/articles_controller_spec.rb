require 'rails_helper'
require 'spec_helper'

describe ArticlesController, :type => :controller do
	describe "GET new" do
		it "initializes article" do
			session[:user_id] = 1
			get :new
			expect(assigns(:article)).not_to be_nil			
		end

		it "fetches all tags" do
			session[:user_id] = 1
			get :new
			expect(assigns(:tags)).not_to be_empty
			expect(assigns(:tags).size).to eq(2)
		end
	end

	describe "GET show" do
		it "fetches an article" do
			get :show, id: 1

			expect(assigns(:article)).not_to be_nil
			expect(assigns(:article).title).to eq("MyString")
			expect(assigns(:article).text).to eq("MyText")
		end

		it "fetches the article's author" do
			get :show, id: 1

			expect(assigns(:user)).not_to be_nil
		end
	end

	describe "GET articles_by_user" do
		it "fetches all articles by a user" do
			get :articles_by_user, user_id: 1

			expect(assigns(:articles)).not_to be_empty
			expect(assigns(:articles).size).to eq(1)
		end
	end

	describe "GET index" do
		it "fetches all articles by logged in user" do
			session[:user_id] = 1

			get :index
			expect(assigns(:user_articles)).not_to be_empty
		end

		it "fetches articles by logged in user with no articles" do
			session[:user_id] = 3

			get :index
			expect(assigns(:user_articles)).to be_empty
		end
	end
end