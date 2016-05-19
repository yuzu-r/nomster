class Place < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :photos, dependent: :destroy

  has_many :placetags
  has_many :tagwords, through: :placetags

  validates :name, presence: true, length: { minimum: 3}
  validates :address, presence: true
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode
  
end
