class Tagword < ActiveRecord::Base
  has_many :placetags
  has_many :places, through: :placetags
  validates :name, presence: true, uniqueness: true
end
