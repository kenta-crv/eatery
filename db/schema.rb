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

ActiveRecord::Schema.define(version: 2021_02_13_155226) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "eateries", force: :cascade do |t|
    t.string "store"
    t.string "store_kana"
    t.string "url"
    t.string "tel"
    t.string "prefecture"
    t.string "city"
    t.string "town"
    t.string "chome"
    t.string "building"
    t.string "genre"
    t.string "payment"
    t.string "price_lunch"
    t.string "price_dinner"
    t.string "hour"
    t.string "holiday"
    t.string "difficulty"
    t.string "bookking"
    t.string "sit"
    t.date "open"
    t.string "chef"
    t.string "career"
    t.string "remarks"
    t.string "takeout"
    t.string "image_1"
    t.string "image_2"
    t.string "image_3"
    t.string "image_4"
    t.string "image_5"
    t.string "image_6"
    t.string "image_7"
    t.string "image_8"
    t.string "image_9"
    t.string "image_10"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "canonical_name"
    t.string "situation"
    t.index ["user_id"], name: "index_eateries_on_user_id"
  end

  create_table "eaterists", force: :cascade do |t|
    t.integer "eatery_id"
    t.string "delicious_score"
    t.string "mood_score"
    t.string "cont_performance_score"
    t.string "service_score"
    t.string "imagination_score"
    t.string "original_score"
    t.string "revisit"
    t.string "average_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eatery_id"], name: "index_eaterists_on_eatery_id"
  end

  create_table "releases", force: :cascade do |t|
    t.string "title"
    t.string "file"
    t.string "description"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "eatery_id"
    t.integer "user_id"
    t.string "delicious_score"
    t.string "mood_score"
    t.string "cost_performance_score"
    t.string "service_score"
    t.string "imagination_score"
    t.string "original1"
    t.string "original1_score"
    t.string "original2"
    t.string "original2_score"
    t.string "revisit"
    t.string "average_price"
    t.string "title"
    t.string "keyword"
    t.string "description"
    t.date "visited"
    t.text "body"
    t.string "image_1"
    t.string "image_2"
    t.string "image_3"
    t.string "image_4"
    t.string "image_5"
    t.string "image_6"
    t.string "image_7"
    t.string "image_8"
    t.string "image_9"
    t.string "image_10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "day"
    t.string "image_11"
    t.string "image_12"
    t.string "image_13"
    t.string "image_14"
    t.string "image_15"
    t.string "image_16"
    t.string "image_17"
    t.string "image_18"
    t.string "image_19"
    t.string "image_20"
    t.string "image_21"
    t.string "image_22"
    t.string "image_23"
    t.string "image_24"
    t.string "image_25"
    t.string "image_26"
    t.string "image_27"
    t.string "image_28"
    t.string "image_29"
    t.string "image_30"
    t.integer "status", default: 0, null: false
    t.string "select"
    t.string "situation"
    t.index ["eatery_id"], name: "index_reviews_on_eatery_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "specials", force: :cascade do |t|
    t.integer "admin_id"
    t.string "title"
    t.string "file"
    t.string "choice"
    t.string "keyword"
    t.string "description"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_specials_on_admin_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "store"
    t.string "evaluation"
    t.string "url"
    t.string "tel"
    t.string "address"
    t.string "genre"
    t.string "payment"
    t.string "price_lunch"
    t.string "price_dinner"
    t.string "hour"
    t.string "holiday"
    t.string "budget"
    t.string "price"
    t.string "difficulty"
    t.string "bookking"
    t.string "sit"
    t.string "open"
    t.string "remarks"
    t.string "takeout"
    t.string "image_1"
    t.string "image_2"
    t.string "image_3"
    t.string "image_4"
    t.string "image_5"
    t.string "image_6"
    t.string "image_7"
    t.string "image_8"
    t.string "image_9"
    t.string "image_10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subtitles", force: :cascade do |t|
    t.integer "release_id"
    t.integer "user_id"
    t.string "title"
    t.string "file"
    t.string "description"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["release_id"], name: "index_subtitles_on_release_id"
    t.index ["user_id"], name: "index_subtitles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
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

end
