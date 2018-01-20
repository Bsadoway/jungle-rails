class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :rating, presence: true


  def blank_stars
    5 - rating.to_i
  end
end
