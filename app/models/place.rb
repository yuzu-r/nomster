class Place < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :placetags, dependent: :destroy
  has_many :tagwords, through: :placetags
  validates :name, presence: true, length: { minimum: 2}
  validates :address, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  geocoded_by :address
  after_validation :geocode
  
  def tag(tagword)
    if !self.tagged_as?(tagword)
      placetags.create(tagword_id: tagword.id)
    end
  end

  def untag(tagword)
    if self.tagged_as?(tagword)
      placetags.find_by(tagword_id: tagword.id).destroy
    end
  end

  def tagged_as?(tagword)
    tagwords.include?(tagword)
  end

end
