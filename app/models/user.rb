class User < ActiveRecord::Base
  has_many :rides 
  has_many :attractions, through: :rides
  has_secure_password

  validates :name, presence: true
  validates :password, presence: true

  def mood
    if self.happiness && self.nausea
      self.nausea > self.happiness ? "sad" : "happy"
    else
      ''
    end
  end
end
