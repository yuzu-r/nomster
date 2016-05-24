require 'rails_helper'

RSpec.describe Placetag, type: :model do
  it "has a valid factory" do
    pt_count = Placetag.count
    place = FactoryGirl.create(:place)
    tagword = FactoryGirl.create(:tagword)
    pt = FactoryGirl.create(:placetag, place_id: place.id, tagword_id: tagword.id)
    expect(pt.valid?).to eq true
    expect(Placetag.count).to eq pt_count+1
  end
  it "requires a tagword_id" do
    place = FactoryGirl.create(:place)
    pt = FactoryGirl.build(:placetag, place_id: place.id, tagword_id: '')
    expect(pt.valid?).to eq false
  end
  it "requires a place_id" do
    tagword = FactoryGirl.create(:tagword)
    pt = FactoryGirl.build(:placetag, place_id: '', tagword_id: tagword.id)
    expect(pt.valid?).to eq false
  end

end
