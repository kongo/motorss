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

ActiveRecord::Schema.define(version: 20131103120305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "proposals", force: true do |t|
    t.string   "make"
    t.string   "model_name"
    t.string   "papers"
    t.integer  "mileage"
    t.integer  "year_built"
    t.integer  "displacement"
    t.string   "place"
    t.string   "price"
    t.datetime "date_published"
    t.string   "link"
    t.text     "description"
    t.string   "contacts"
    t.datetime "date_presence_checked"
    t.datetime "date_vanished"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "uin",                              null: false
    t.string   "vehicle_type",          limit: 20
    t.string   "ms_photo_file_name",    limit: 40
    t.string   "location",              limit: 30
  end

  add_index "proposals", ["uin"], name: "index_proposals_on_uin", using: :btree
  add_index "proposals", ["vehicle_type", "papers"], name: "index_proposals_on_vehicle_type_and_papers", using: :btree

end
