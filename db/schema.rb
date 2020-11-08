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

ActiveRecord::Schema.define(version: 2020_11_08_020726) do

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "roadmap_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roadmaps", force: :cascade do |t|
    t.text "title"
    t.integer "stady_time_week"
    t.integer "stady_time_holiday"
    t.integer "period_stady"
    t.integer "total_stady_time"
    t.text "total_comment"
    t.integer "user_id"
    t.integer "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "display", default: true
  end

  create_table "roadmapshows", force: :cascade do |t|
    t.string "content"
    t.string "method"
    t.integer "time_required"
    t.text "comment"
    t.integer "roadmap_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "hour_required", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "comment"
    t.string "link"
    t.integer "mymap"
    t.string "image_name"
    t.string "password_digest"
    t.boolean "admin", default: false
  end

end
