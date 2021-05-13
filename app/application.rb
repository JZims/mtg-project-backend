class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    #checks that request is a GET and the path requested is looking at the "decks" page
    if req.path == "/decks" && req.get? 
    
      all_decks = Deck.all.to_json({
        methods: [:owner, :rentals]
      })
      return [200, { 'Content-Type' => 'application/json' }, [ all_decks ]]
  
    elsif req.path == "/owners" && req.get?

      all_owners = Owner.all.to_json({include: :decks})

      return [200, { 'Content-Type' => 'application/json' }, [ all_owners ]]

    elsif req.path.match(/decks/) && req.get?
      id = req.path.split("/decks/").last
      deck = Deck.find(id)
      deck_json = deck.to_json({
        include: {
          rentals: {
            include: :renter
          }
        },
        methods: [:owner]
      })
      
      return [200, { 'Content-Type' => 'application/json' }, [ deck_json ]]

    elsif req.path.match(/decks/) && req.delete?
      id = req.path.split("/decks/").last
      deck = Deck.find(id)
      deck.destroy
      
      return [200, { 'Content-Type' => 'application/json' }, [ deck.to_json ]]

    elsif req.path.match(/decks/) && req.patch?
      hash = JSON.parse(req.body.read)
      id = req.path.split("/decks/").last
      deck = Deck.find(id)
      last_rental = deck.get_decks_last_rental
      last_rental.update_rental(hash)
      deck.check_in_deck
      # binding.pry
      
      return [200, { 'Content-Type' => 'application/json' }, [ last_rental.to_json ]]

    elsif req.path == "/owners" && req.post?
      
        hash = JSON.parse(req.body.read)
        new_owner = Owner.create(hash)

        return [201, { 'Content-Type' => 'application/json'}, [ new_owner.to_json]]

    elsif req.path == "/decks" && req.post?
      hash = JSON.parse(req.body.read)
      
      new_deck = Deck.create(hash)
      # new_deck.set_owner()
        return [201, { 'Content-Type' => 'application/json'}, [ new_deck.to_json]]

    elsif req.path == "/rentals" && req.get?

      all_rentals = Rental.all.to_json

      return [200, { 'Content-Type' => 'application/json' }, [ all_rentals ]]

    elsif req.path == "/rentals" && req.post?
  
      hash = JSON.parse(req.body.read)
      new_rental = Rental.create(hash)
      Deck.find(hash["deck_id"]).check_out_deck
        return [201, { 'Content-Type' => 'application/json'}, [ new_rental.to_json]]

    elsif req.path == "/renters" && req.get?

      all_renters = Renter.all.to_json

      return [200, { 'Content-Type' => 'application/json' }, [ all_renters ]]

    elsif req.path == "/renters" && req.post?
  
      hash = JSON.parse(req.body.read)
      new_renter = Renter.create(hash)
        return [201, { 'Content-Type' => 'application/json'}, [ new_renter.to_json ]]
        
    end
    resp.finish
  end

end