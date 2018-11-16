class User < ApplicationRecord
  belongs_to :department

  enum position: %i{member manager}
end
