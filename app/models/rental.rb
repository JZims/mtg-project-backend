class Rental < ActiveRecord::Base
    belongs_to :deck
    belongs_to :renter

    def update_rental(hash)
        self.review = hash["review"]
        self.rating = hash["rating"]
        self.save
    end

end