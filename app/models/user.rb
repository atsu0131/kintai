class User < ApplicationRecord
  belongs_to :department
  has_one :timecard

  enum position: %i{member manager}
end
