class User < ActiveRecord::Base
  has_many :rides 
  has_many :attractions, through: :rides
  has_many :attractions, class_name: 'Attraction', foreign_key: 'admin_id' 
  has_secure_password

  validates :name, presence: true
  validates :password_digest, presence: true

  def mood
    if self.happiness && self.nausea
      self.nausea > self.happiness ? "sad" : "happy"
    else
      ''
    end
  end
end
