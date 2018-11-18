class Department < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :approvers, dependent: :destroy
end
