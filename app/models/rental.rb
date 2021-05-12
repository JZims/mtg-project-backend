class Rental < ActiveRecord::Base
    belongs_to :deck
    belongs_to :renter

    # def check_out_deck
    #     self.deck.checked_out = true
    # end

    # def check_in_deck
    #     self.deck.checked_out = false
    # end

end