class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    #checks that request is a GET and the path requested is looking at the "decks" page
    if req.path == "/decks" && req.get? 
    
      all_decks = Deck.all.to_json({
        include: :rentals
      })

      return [200, { 'Content-Type' => 'application/json' }, [ all_decks ]]
  
    elsif req.path == "/owners" && req.get?

      all_owners = Owner.all.to_json

      return [200, { 'Content-Type' => 'application/json' }, [ all_owners ]]

    elsif req.path.match(/decks/) && req.get?
      id = req.path.split("/decks/").last
      deck = Deck.find(id)
      
      return [200, { 'Content-Type' => 'application/json' }, [ deck.to_json({include: {rentals: {include: :renter}}})]]

      # elsif req.path == "/owners" && req.post?
      #   hash = JSON.parse(req.body.read)
      #   new_owner = Owner.create(hash)
      #   return [201, { 'Content-Type' => 'application/json' }, [ new_owner.to_json ]]

    end

    resp.finish
  end

end