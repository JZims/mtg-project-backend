class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    #checks that request is a GET and the path requested is looking at the "decks" page
    if req.path == "/decks" && req.get? 
    
      all_decks = Deck.all.to_json

      return [200, { 'Content-Type' => 'application/json' }, [ all_decks ]]
  
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end