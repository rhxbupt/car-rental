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

ActiveRecord::Schema.define(version: 20171005045805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "location"
    t.string "model"
    t.string "manufacturer"
    t.string "style"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "license_number"
    t.integer "rental_rate"
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "histories", force: :cascade do |t|
    t.string "car_id"
    t.string "user_id"
    t.string "location"
    t.string "model"
    t.string "manufacturer"
    t.string "style"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rental_rate"
    t.integer "license_number"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "noc", default: 0
    t.string "role", default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "cars", "users"
end