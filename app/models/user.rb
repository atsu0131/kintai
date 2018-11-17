class User < ApplicationRecord
  belongs_to :department
  has_many :timecards

  enum position: %i{member manager}
end
