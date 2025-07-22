# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_07_22_045626) do
  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.integer "private_chat_id", null: false
    t.integer "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["private_chat_id"], name: "index_messages_on_private_chat_id"
    t.index ["profile_id"], name: "index_messages_on_profile_id"
  end

  create_table "private_chats", force: :cascade do |t|
    t.integer "profile1_id", null: false
    t.integer "profile2_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile1_id"], name: "index_private_chats_on_profile1_id"
    t.index ["profile2_id"], name: "index_private_chats_on_profile2_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "nickname"
    t.string "profile_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "messages", "private_chats"
  add_foreign_key "messages", "profiles"
  add_foreign_key "private_chats", "profile1s"
  add_foreign_key "private_chats", "profile2s"
end
