require 'rails_helper'

RSpec.describe Tagword, type: :model do
  it "has a valid factory" do
    tagword_count=Tagword.count
    tagword = FactoryGirl.create(:tagword)
    expect(tagword.valid?).to eq true
    expect(Tagword.count).to eq tagword_count+1
  end
  it "must have a name to be valid" do
    tagword_count = Tagword.count
    tagword = FactoryGirl.build(:tagword, name: "")
    expect(tagword.valid?).to eq false
    expect(Tagword.count).to eq tagword_count
  end
  it "has a unique name" do
    tagword = FactoryGirl.create(:tagword, name: "spam")
    tagword_count=Tagword.count
    tagword_dup=FactoryGirl.build(:tagword, name: "spam")
    expect(tagword_dup.valid?).to eq false
  end


end
