class Renter < ActiveRecord::Base
    has_many :rentals
    has_many :decks, through: :rentals
end