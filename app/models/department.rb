class Department < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :users, dependent: :destroy
end
