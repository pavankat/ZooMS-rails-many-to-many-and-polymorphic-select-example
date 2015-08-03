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

ActiveRecord::Schema.define(version: 20150803041943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cat_toys", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "toyable_id"
    t.string   "toyable_type"
  end

  add_index "cat_toys", ["toyable_id", "toyable_type"], name: "index_cat_toys_on_toyable_id_and_toyable_type", using: :btree

  create_table "data_src", id: false, force: true do |t|
    t.string "datasrc_id",  limit: 12
    t.string "authors",     limit: 510
    t.string "title",       limit: 510
    t.string "year",        limit: 8
    t.string "journal",     limit: 270
    t.string "vol_city",    limit: 32
    t.string "issue_state", limit: 10
    t.string "start_page",  limit: 10
    t.string "end_page",    limit: 10
  end

  create_table "datsrcln", id: false, force: true do |t|
    t.integer "ndb_no"
    t.integer "nutr_no"
    t.string  "datasrc_id", limit: 12
  end

  create_table "deriv_cd", id: false, force: true do |t|
    t.string "deriv_cd",   limit: 8
    t.string "deriv_desc", limit: 240
  end

  create_table "fd_group", id: false, force: true do |t|
    t.string "fdgrp_cd",   limit: 8
    t.string "fdgrp_desc", limit: 120
  end

  create_table "lion_tamers", force: true do |t|
    t.string   "name"
    t.integer  "experience"
    t.boolean  "living"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lion_tamers_lions", id: false, force: true do |t|
    t.integer "lion_tamer_id", null: false
    t.integer "lion_id",       null: false
  end

  add_index "lion_tamers_lions", ["lion_id", "lion_tamer_id"], name: "index_lion_tamers_lions_on_lion_id_and_lion_tamer_id", using: :btree
  add_index "lion_tamers_lions", ["lion_tamer_id", "lion_id"], name: "index_lion_tamers_lions_on_lion_tamer_id_and_lion_id", using: :btree

  create_table "lions", force: true do |t|
    t.date     "birthdate"
    t.string   "name"
    t.text     "about"
    t.integer  "weight"
    t.integer  "health"
    t.text     "health_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "panthers", force: true do |t|
    t.string   "name"
    t.integer  "claw_length"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "src_cd", id: false, force: true do |t|
    t.string "src_cd",     limit: 4
    t.string "srccd_desc", limit: 120
  end

end
