class User < ApplicationRecord
  validates :department_id, presence: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  belongs_to :department
  has_many :timecards, dependent: :destroy

  enum position: %i{member manager}
end
