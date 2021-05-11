class Deck < ActiveRecord::Base
  belongs_to :owner
  has_many :rentals
  has_many :renters, through: :rentals



end

