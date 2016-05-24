class Tagword < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :placetags
end
