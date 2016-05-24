require 'rails_helper'

RSpec.describe Place, type: :model do
    it "has a valid factory" do
    place_count = Place.count
    expect(FactoryGirl.create(:place)).to be_valid
    expect(Place.count).to eq place_count+1
  end

  it "is invalid without a user id" do
    expect(FactoryGirl.build(:place, user: nil)).to_not be_valid
  end

  it "is invalid if user id does not exist in user table"
  
  it "is invalid without a name" do
    expect(FactoryGirl.build(:place, name: '')).to_not be_valid
  end

  it "is invalid if name is less than two characters" do
    expect(FactoryGirl.build(:place, name: 'a')).to_not be_valid
  end

  it "is invalid without a description" do
    expect(FactoryGirl.build(:place, description: '')).to_not be_valid
  end

  it "is invalid without an address" do
    expect(FactoryGirl.build(:place, address: '')).to_not be_valid
  end

  it "destroys associated comments if destroyed" do
    place = FactoryGirl.create(:place)
    commenter = FactoryGirl.create(:user)
    comment = FactoryGirl.create(:comment, place: place, user: commenter)
    place.destroy
    expect(Comment.find_by_id(comment.id)).to eq nil
  end

  it "destroys associated photos if destroyed"

  it "can .tag(tagword), .untag(tagword), and use tagged_as?(tagword)" do
    place=FactoryGirl.create(:place)
    tagword = FactoryGirl.create(:tagword)
    expect(place.tagged_as?(tagword)).to eq false
    place.tag(tagword)
    expect(place.tagged_as?(tagword)).to eq true
    place.untag(tagword)
    expect(place.tagged_as?(tagword)).to eq false
  end


  it "destroys associated placetags if destroyed" do
    #place = FactoryGirl.create(:place)
    #tagword = FactoryGirl.create(:tagword)
    #placetag = FactoryGirl.create(:placetag, place: place, tagword: tagword)
    #place.destroy
    #expect(Placetag.find_by_id(placetag.id)).to eq nil
  end

  it "can be tagged with a tagword using .tag" do
    place=FactoryGirl.create(:place)
    tagword = FactoryGirl.create(:tagword)
    placetag_count = Placetag.count
    place.tag(tagword)
    expect(Placetag.count).to eq placetag_count + 1    
  end

  it "can be untagged using .untag" do
    place = FactoryGirl.create(:place)
    tagword = FactoryGirl.create(:tagword)
    place.tag(tagword)
    placetag_count = Placetag.count
    place.untag(tagword)
    expect(Placetag.count).to eq placetag_count -1
  end

  it "is not tagged again with a duplicate tagword" do
    place = FactoryGirl.create(:place)
    tagword = FactoryGirl.create(:tagword)
    place.tag(tagword)
    placetag_count = Placetag.count
    place.tag(tagword)
    expect(Placetag.count).to eq placetag_count
  end

  it "is not untagged again with a duplicate tagword" do
    place = FactoryGirl.create(:place)
    tagword = FactoryGirl.create(:tagword)
    place.tag(tagword)
    place.untag(tagword)
    placetag_count=Placetag.count
    place.untag(tagword)
    expect(Placetag.count).to eq placetag_count
  end

  it "responds to .tagged_as? with true if place is already tagged" do
    place = FactoryGirl.create(:place)
    tagword = FactoryGirl.create(:tagword)
    place.tag(tagword)
    expect(place.tagged_as?(tagword)).to eq true
  end

  it "responds to .tagged_as? with false if place is not tagged" do
    place = FactoryGirl.create(:place)
    tagword = FactoryGirl.create(:tagword)
    expect(place.tagged_as?(tagword)).to eq false    
  end
end
