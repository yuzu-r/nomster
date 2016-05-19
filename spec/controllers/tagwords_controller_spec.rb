require 'rails_helper'

RSpec.describe TagwordsController, type: :controller do
  
  describe "tags#new action" do
    it "should require a user to be signed in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it "should display the page to create a tag" do
      u = FactoryGirl.create(:user)
      sign_in u
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "tags#create action" do
    it "should require a user to be signed in" do
      post :create, tagword: {name: 'www'}
      expect(response).to redirect_to new_user_session_path
    end

    it "should create a tag" do
      u = FactoryGirl.create(:user)
      sign_in u
      tag_count = Tagword.count
      post :create, tagword: {name: 'spam'}
      expect(Tagword.count).to eq tag_count+1
      expect(Tagword.last.name).to eq 'spam'
      expect(response).to redirect_to tagwords_path
    end

    it "should not allow a duplicate tag to be created" do
      u = FactoryGirl.create(:user)
      sign_in u
      post :create, tagword: {name: 'saimin'}
      tag_count = Tagword.count
      post :create, tagword: {name: 'saimin'}
      expect(Tagword.count).to eq tag_count
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "should require user to enter a tag name" do
      u = FactoryGirl.create(:user)
      sign_in u
      tag_count = Tagword.count
      post :create, tagword: {name: ''}
      expect(Tagword.count).to eq tag_count
      expect(response).to have_http_status(:unprocessable_entity)
    end

  end

  describe "tags#index action" do
    it "should display index page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
