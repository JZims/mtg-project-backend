class CreateDecks < ActiveRecord::Migration[5.2]

  def change
    create_table :decks do |t|
      t.string :name
      t.string :img_url
      t.integer :commander_id
      t.string :commander_id
      t.string :deck_bio
      t.string :link_url
      t.boolean :checked_out
      t.integer :owner_id
  end
end
end
