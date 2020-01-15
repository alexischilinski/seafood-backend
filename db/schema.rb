# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_15_164924) do

  create_table "fish", force: :cascade do |t|
    t.string "name"
    t.string "scientific_name"
    t.string "biology"
    t.string "location"
    t.string "image"
    t.string "population"
    t.string "harvest"
    t.string "harvest_type"
    t.string "best_harvest"
    t.string "farming_methods"
    t.string "fishing_rate"
    t.string "availability"
    t.string "health_benefits"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "region"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_fishes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "fish_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fish_id"], name: "index_user_fishes_on_fish_id"
    t.index ["user_id"], name: "index_user_fishes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "region_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["region_id"], name: "index_users_on_region_id"
  end

  add_foreign_key "user_fishes", "fish"
  add_foreign_key "user_fishes", "users"
  add_foreign_key "users", "regions"
end
