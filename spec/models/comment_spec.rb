require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "has a valid factory" do
    comment_count = Comment.count
    expect(FactoryGirl.create(:comment)).to be_valid
    expect(Comment.count).to eq comment_count+1
  end
  it "is not valid without a place_id"
  it "is not valid without a user_id"
  it "is not valid if both message and rating are missing"
  it "is not valid if message is over 255 characters"
  it "converts rating from 5 stars to 5_stars"
  it "sends email to the owner of the place when a comment is generated"
end


