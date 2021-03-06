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

ActiveRecord::Schema.define(version: 20150409000808) do

  create_table "counter_offers", force: :cascade do |t|
    t.integer  "offer_id"
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.integer  "offer_price"
    t.text     "offer_terms"
    t.date     "offer_expiration"
    t.integer  "listing_id"
    t.integer  "offer_deposit"
    t.integer  "ps_deposit"
    t.date     "purchase_sale_date"
    t.date     "closing_date"
    t.decimal  "financing_amount"
    t.date     "mortgage_contingency_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "status"
    t.integer  "author"
  end

  create_table "deals", force: :cascade do |t|
    t.integer  "offer_id"
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.integer  "deal_price"
    t.text     "offer_terms"
    t.integer  "listing_id"
    t.integer  "offer_deposit"
    t.integer  "ps_deposit"
    t.date     "purchase_sale_date"
    t.date     "closing_date"
    t.decimal  "financing_amount"
    t.date     "mortgage_contingency_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string   "street_address"
    t.string   "street_address_2"
    t.string   "area_code"
    t.string   "state"
    t.integer  "listing_price"
    t.string   "city"
    t.text     "description"
    t.integer  "number_bedrooms"
    t.integer  "number_full_baths"
    t.integer  "number_half_baths"
    t.integer  "living_area"
    t.string   "lot_size"
    t.integer  "taxes"
    t.integer  "number_living_levels"
    t.boolean  "master_bathroom"
    t.integer  "garage_spaces"
    t.integer  "parking_spaces"
    t.string   "year_built"
    t.boolean  "waterfront"
    t.string   "heating"
    t.string   "cooling"
    t.boolean  "lead_paint"
    t.string   "lot_description"
    t.string   "sf_style"
    t.string   "foundation_description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "user_id"
    t.integer  "status"
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "offer_price"
    t.text     "offer_terms"
    t.date     "offer_expiration"
    t.integer  "listing_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "user_id"
    t.integer  "offer_deposit"
    t.integer  "ps_deposit"
    t.date     "purchase_sale_date"
    t.date     "closing_date"
    t.decimal  "financing_amount"
    t.date     "mortgage_contingency_date"
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.integer  "status"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "subtitle"
  end

  create_table "showings", force: :cascade do |t|
    t.datetime "showing_time"
    t.integer  "listing_id"
    t.integer  "status"
    t.string   "comments"
    t.integer  "user_id"
    t.integer  "seller_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
