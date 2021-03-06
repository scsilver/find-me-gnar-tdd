# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160111084011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "directions", force: :cascade do |t|
    t.string   "from"
    t.string   "to"
    t.float    "distance"
    t.float    "traffic_time"
    t.string   "hazards"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "resorts", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "station"
    t.integer  "base"
    t.float    "temp"
    t.integer  "snowfall_24hr"
    t.float    "rating"
    t.string   "webcam"
    t.string   "site"
    t.string   "symbol"
    t.string   "s_xpath_base"
    t.string   "s_url"
    t.string   "s_xpath_24hr"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.string   "user"
    t.string   "content"
    t.string   "time"
    t.integer  "resort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tweets", ["resort_id"], name: "index_tweets_on_resort_id", using: :btree

  add_foreign_key "tweets", "resorts"
end
