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

ActiveRecord::Schema.define(version: 20151119063401) do

  create_table "parshas", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "available",  limit: 1,   default: true
    t.integer  "people_id",  limit: 4
    t.integer  "past_id",    limit: 4
    t.integer  "sefer_id",   limit: 4
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pasts", force: :cascade do |t|
    t.integer  "people_id",  limit: 4
    t.integer  "parsha_id",  limit: 4
    t.integer  "times_read", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.date     "birthday"
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.string   "phone",      limit: 255
    t.string   "address",    limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.integer  "past_id",    limit: 4
    t.text     "notes",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
