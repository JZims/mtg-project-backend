class Rental < ActiveRecord::Base
    belongs_to :deck
    belongs_to :renter
end