# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_11_015340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "decks", force: :cascade do |t|
    t.string "name"
    t.string "img_url"
    t.integer "commander_id"
    t.string "deck_bio"
    t.string "link_url"
    t.boolean "checked_out"
    t.integer "owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
  end

  create_table "rentals", force: :cascade do |t|
    t.string "review"
    t.integer "rating"
    t.integer "rental_length"
    t.integer "deck_id"
    t.integer "renter_id"
  end

  create_table "renters", force: :cascade do |t|
    t.string "name"
  end

end
