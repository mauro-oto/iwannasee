# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110606174416) do

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.string   "cuevana"
    t.float    "rating"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "small_image"
    t.integer  "position"
    t.integer  "user_id"
    t.string   "link_imdb"
    t.boolean  "seen"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "persistence_token"
  end

end
