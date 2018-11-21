class Department < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :users, dependent: :destroy
  has_many :approval_authorities, dependent: :destroy
  has_many :approvers, through: :approval_authorities, source: :user
end
