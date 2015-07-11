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

ActiveRecord::Schema.define(version: 20150711115543) do

  create_table "appointments", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "status",       default: 1
    t.text     "about"
    t.integer  "gender"
    t.float    "price"
    t.integer  "review_count"
    t.float    "avg_rating"
    t.integer  "session_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants_specializations", id: false, force: true do |t|
    t.integer "merchant_id"
    t.integer "specialization_id"
  end

  create_table "openings", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "status",      default: 1
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specializations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
