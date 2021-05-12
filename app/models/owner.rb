 class Owner < ActiveRecord::Base 
  has_many :decks
  has_many :rentals, through: :decks
  has_many :renters, through: :rentals

    def consistent_data
    end
  
 end