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

ActiveRecord::Schema.define(version: 20140818052547) do

  create_table "cars", force: true do |t|
    t.string   "name"
    t.string   "status",                             default: "available"
    t.decimal  "latitude",   precision: 8, scale: 5
    t.decimal  "longitude",  precision: 8, scale: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cars", ["latitude", "longitude"], name: "index_cars_on_latitude_and_longitude"

  create_table "orders", force: true do |t|
    t.string   "status",          default: "pending"
    t.integer  "car_id"
    t.integer  "user_id"
    t.string   "pickup_location"
    t.string   "destination"
    t.string   "send_name"
    t.string   "tel"
    t.string   "email"
    t.string   "recipient"
    t.string   "recipient_tel"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["car_id"], name: "index_orders_on_car_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "users", force: true do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.string   "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
