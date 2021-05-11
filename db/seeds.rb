
Owner.destroy_all
Deck.destroy_all
Rental.destroy_all
Renter.destroy_all



owner1 = Owner.create(name: "Sideshow Bob")
owner2 = Owner.create(name: "Notorious JLK")
owner3 = Owner.create(name: "Cassius Marsh")



deck1 = Deck.create(
    name: "Rhys J.R.R. Tokens",
    img_url:  "https://c1.scryfall.com/file/scryfall-cards/large/front/b/9/b91dadcb-31e9-43b0-b425-c9311af3e9d7.jpg?1599708272",
    commander_id: "b91dadcb-31e9-43b0-b425-c9311af3e9d7",
    deck_bio:  "First time using Tappedout, decided to list my Rhys, the Redeemed deck. Have had over years, built and rebuilt over and over again, this is about where it's going to settle.
    Strong token production with elf tribal and good stuff flavor. Not a fan of infinite, so just some strong synergy combos within this list.
    Let me know opinions and suggestions.
    P.S. Only used for casual play; my Savannah is a proxy.",
    link_url: "https://tappedout.net/mtg-decks/rhys-jrr-tokens/", 
    checked_out: false, 
    owner_id: owner1.id

)
deck2 = Deck.create(
    name: "Om Nom Trample",
    img_url:  "https://c1.scryfall.com/file/scryfall-cards/large/front/9/7/97ab4974-d0a4-4033-b150-8928b46dc626.jpg?1562927121",
    commander_id: "97ab4974-d0a4-4033-b150-8928b46dc626",
    deck_bio:  "I chose Kamahl as the commander because he epitomizes what green does best. He's a great mana dump, can make creatures from lands for both offensive and defensive purposes, and can Overrun at instant speed multiples times each turn. He's been one of, if not, my favorite card ever printed. He was the first legendary I ever pulled out of a pack, and with commander, I finally found a great way to make him usable and abusable.",
    link_url: "https://tappedout.net/mtg-decks/om-nom-trample/", 
    checked_out: false, 
    owner_id: owner2.id

)

deck3 = Deck.create(
    name: "Toadally Froggy",
    img_url:  "https://c1.scryfall.com/file/scryfall-cards/large/front/e/a/eafb8740-1bab-4f5e-96d1-79f1f04cc0d8.jpg?1608911032",
    commander_id: "eafb8740-1bab-4f5e-96d1-79f1f04cc0d8",
    deck_bio:  "Only cards with toads, frogs, or lily pads in their art or oracle text. Plus some other cards to add flavor and function like Jump , Environmental Sciences , Ecological Appreciation (come on, there's got to be a frog in there somewhere), Witch's Cottage , Zoologist , Growth Spiral , Gor Muldrak, Amphinologist , Evolution Charm , Gilded Lotus , Peer Pressure , Khalni Heart Expedition , Harrow and Magnifying Glass (to study the frogs).
    This deck can technically win out of nowhere with Polymorphist's Jest and Peer Pressure.",
    link_url: "https://tappedout.net/mtg-decks/toadally-froggy/", 
    checked_out: false, 
    owner_id: owner3.id

)

renter1 = Renter.create( name: "Josh")
renter2 = Renter.create(name: "Zach")
renter3 = Renter.create(name: "Baloo")



rental1= Rental.create(
    review: "Deck is meh", 
    rating: 2,
    rental_length: 3, 
    deck_id: deck1.id, 
    renter_id: renter1.id
)

rental1= Rental.create(
    review: "Deck is sick", 
    rating: 5,
    rental_length: 6, 
    deck_id: deck2.id, 
    renter_id: renter2.id
)

rental1= Rental.create(
    review: "Deck is balls", 
    rating: 1,
    rental_length: 1, 
    deck_id: deck3.id, 
    renter_id: renter3.id
)


