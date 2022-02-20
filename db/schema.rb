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

ActiveRecord::Schema.define(version: 2022_02_20_065238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "geolocations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "ip", null: false
    t.string "ip_type"
    t.string "continent_code"
    t.string "continent_name"
    t.string "country_code"
    t.string "country_name"
    t.string "region_code"
    t.string "region_name"
    t.string "city"
    t.integer "zip"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_geolocations_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "geolocation_id"
    t.integer "geoname_id", null: false
    t.string "capital"
    t.string "languages"
    t.string "country_flag"
    t.string "country_flag_emoji"
    t.string "country_flag_emoji_unicode"
    t.integer "calling_code"
    t.boolean "is_eu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geolocation_id"], name: "index_locations_on_geolocation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "geolocations", "users"
  add_foreign_key "locations", "geolocations"
end
