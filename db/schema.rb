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

ActiveRecord::Schema.define(version: 20170212232705) do

  create_table "orders", force: :cascade do |t|
    t.integer  "ItemID"
    t.integer  "CustomerID"
    t.decimal  "InternationalShippingFee"
    t.decimal  "DomesticShippingFee"
    t.decimal  "ExchangeRate"
    t.decimal  "Price"
    t.integer  "From"
    t.integer  "Status"
    t.decimal  "Refund"
    t.date     "CompletedDate"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "CustomerFirstName"
    t.string   "CustomerLastName"
    t.string   "CustomerPhone"
    t.string   "CustomerAddress"
    t.string   "Brand"
    t.decimal  "Cost"
    t.string   "Description"
    t.integer  "user_id"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
