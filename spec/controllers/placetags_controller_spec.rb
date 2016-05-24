require 'rails_helper'

RSpec.describe PlacetagsController, type: :controller do

  describe "placetag#create action" do
   it "should allow a placetag to be created" do
      place = FactoryGirl.create(:place)
      sign_in place.user
      t = FactoryGirl.create(:tagword)
      placetag_count = Placetag.count
      #get :index, {:page_id => @page.id, :article_id => @article.id}
      post :create, placetag: {place_id: place.id, tagword_id: t.id}
      #expect(Placetag.count).to eq placetag_count + 1 
    end

    it "should check that the user is authorized to make a tag on the place" do
    end

    it "should check that the tag exists in tagword before creating" do
    end

    it "should check that the place exists in place before creating" do
    end

    it "should check that the user is signed in" do
    end    

  end

  #describe "placetag#destroy action" do
  #  it "should allow a placetag to be deleted" do
  #    place = FactoryGirl.create(:place)
  #    t = FactoryGirl.create(:tagword)
  #    placetag_count = Placetag.count
  #    placetag = post :create, placetag: {place_id: place.id, tagword_id: t.id}
  #    expect(Placetag.count).to eq placetag_count+1
  #    delete :destroy, id: placetag.id
  #    expect(Placetag.count).to eq placetag_count

  #  end

  #  it "should check that the user is authorized to delete a tag on the place" do
  #  end

  #end 

end
