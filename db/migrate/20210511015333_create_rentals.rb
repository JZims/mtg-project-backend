class CreateRentals < ActiveRecord::Migration[5.2]

  def change
    create_table :rentals do |t|
      t.string :review
      t.integer :rating
      t.integer :rental_length
      t.integer :deck_id
      t.integer :renter_id
  end
end
end
