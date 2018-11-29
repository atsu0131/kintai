class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 10 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :position, presence: true

  belongs_to :department
  has_many :timecards, dependent: :destroy
  has_many :approval_authorities, dependent: :destroy
  has_many :approvable_departments, through: :approval_authorities, source: :department

  enum position: %i{member manager}
end
