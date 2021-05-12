class Deck < ActiveRecord::Base
  belongs_to :owner
  has_many :rentals
  has_many :renters, through: :rentals

  def my_owner_name
    "#{self.owner.name}"
  end

  def dummy_method
    "Hello"
  end

  def check_out_deck
    self.checked_out = true
end

def check_in_deck
    self.checked_out = false
end

def set_owner(id)
  self.owner_id = id
end

end

