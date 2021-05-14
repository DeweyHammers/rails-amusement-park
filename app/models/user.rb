class User < ActiveRecord::Base
  validates :name, presence: true
  validates :password, presence: true
  validates :nausea, presence: true
  validates :happiness, presence: true
  validates :tickets, presence: true
  validates :height, presence: true
end
