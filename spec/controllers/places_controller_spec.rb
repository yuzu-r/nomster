require 'rails_helper'

RSpec.describe PlacesController, type: :controller do

  describe "places#show action" do
    it "should show the places detail page" do
      p = FactoryGirl.create(:place)
      get :show, id: p.id
      expect(response).to have_http_status(:success)
    end

    it "should give a not found if the place is not found" do
      get :show, id: 'batsu'
      expect(response).to have_http_status(:not_found)
    end

    #it "should show comments if there are any" do
    #end

  end

  describe "places#new action" do
    it "should require user to login" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show the new places form for signed in user" do
      u = FactoryGirl.create(:user)
      sign_in u
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "places#create action" do
    it "should require user to login" do
      place_count = Place.count
      post :create, place: {name: "here", address: "100 Main", description: "bad"}
      expect(response).to redirect_to new_user_session_path
      expect(place_count).to eq Place.count
    end

    it "successfully creates a place" do
      u = FactoryGirl.create(:user)
      sign_in u
      post :create, place: {name: "here", address: "010 main", description: "ono"}
      expect(response).to redirect_to root_path
      expect(Place.last.description).to eq 'ono'
    end

    it "does not create a place if required information is missing" do
      u = FactoryGirl.create(:user)
      sign_in u
      place_count = Place.count
      post :create, place: {name: "", address: "", description: "bah"}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Place.count).to eq place_count
    end

  end

end
