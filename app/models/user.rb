class User < ApplicationRecord
  belongs_to :department
  has_many :timecards, dependent: :destroy
  has_many :approvers, dependent: :destroy
  has_many :approver_departments, through: :approves, source: :department

  enum position: %i{member manager}
end
