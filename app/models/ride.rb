class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  validates :attraction_id, presence: true
  validates :user_id, presence: true

  def take_ride
    user = self.user
    attraction = self.attraction

    if user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save(validate: false)
      "Thanks for riding the #{attraction.name}!"
    end
  end
end
