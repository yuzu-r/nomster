FactoryGirl.define do
  factory :placetag do
    tagword nil
    place nil
  end
  factory :tagword do
    name "MyString"
  end
  factory :user do
    sequence :email do |n|
      "test_email#{n}@example.com"
    end
    password "password"
    password_confirmation "password"
  end

  factory :place do
    sequence :name do |n|
      "Zippys Local #{n}"
    end
    address "5251 Westheimer, Houston, TX"
    description "ono"
    association :user
  end
end
