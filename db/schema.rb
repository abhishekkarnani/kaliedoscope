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

ActiveRecord::Schema.define(version: 20151017233233) do

  create_table "admin_photos", force: :cascade do |t|
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "admin_settings", force: :cascade do |t|
    t.integer  "tabs"
    t.integer  "tab_1_columns"
    t.integer  "tab_2_columns"
    t.integer  "tab_3_columns"
    t.integer  "tab_4_columns"
    t.integer  "tab_5_columns"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "tab"
    t.integer  "column"
  end

  create_table "announcements", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "status"
    t.boolean  "maintenance"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "assets", force: :cascade do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "meta_datum_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "meta_data", force: :cascade do |t|
    t.string   "heading"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "image_count"
  end

end
