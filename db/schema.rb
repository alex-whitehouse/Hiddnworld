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

ActiveRecord::Schema.define(version: 2021_12_04_215554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "completed_nodes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "node_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["node_id"], name: "index_completed_nodes_on_node_id"
    t.index ["user_id", "node_id"], name: "index_completed_nodes_on_user_id_and_node_id", unique: true
    t.index ["user_id"], name: "index_completed_nodes_on_user_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.decimal "lat"
    t.decimal "long"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "trail_id", null: false
    t.string "hint"
    t.index ["trail_id"], name: "index_nodes_on_trail_id"
  end

  create_table "trails", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "completed_nodes", "nodes"
  add_foreign_key "completed_nodes", "users"
  add_foreign_key "nodes", "trails"
end
