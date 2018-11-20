class Timecard < ApplicationRecord
  validates :start_at, presence: true
  validates :user_id, presence: true
  belongs_to :user
end
