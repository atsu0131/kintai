class Department < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 10 }

  has_many :users, dependent: :destroy
end
