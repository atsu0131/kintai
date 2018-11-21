class User < ApplicationRecord
  belongs_to :department
  has_many :timecards, dependent: :destroy
  has_many :approval_authorities, dependent: :destroy
  has_many :approvable_departments, through: :approval_authorities, source: :department

  enum position: %i{member manager}
end
