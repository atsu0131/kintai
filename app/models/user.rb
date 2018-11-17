class User < ApplicationRecord
  belongs_to :department
  has_many :timecards, dependent: :destroy

  enum position: %i{member manager}
end
