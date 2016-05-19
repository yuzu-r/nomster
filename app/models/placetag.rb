class Placetag < ActiveRecord::Base
  belongs_to :tagword
  belongs_to :place
end
