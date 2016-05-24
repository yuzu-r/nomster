class Placetag < ActiveRecord::Base
  belongs_to :tagword
  belongs_to :place
  validates :place_id, presence: true
  validates :tagword_id, presence: true
end
