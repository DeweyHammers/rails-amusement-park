class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  validates :attraction_id, presence: true
  validates :user_id, presence: true
end
