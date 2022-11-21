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

ActiveRecord::Schema[7.0].define(version: 2022_11_20_075634) do
  create_table "boards", force: :cascade do |t|
    t.integer "number_of_players", default: 2, null: false
    t.integer "player_turn"
    t.boolean "active", default: true, null: false
    t.string "winner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paths", force: :cascade do |t|
    t.integer "source", null: false
    t.integer "destination", null: false
    t.integer "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id", "source"], name: "index_paths_on_board_id_and_source", unique: true
    t.index ["board_id"], name: "index_paths_on_board_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.integer "position", null: false
    t.integer "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_players_on_board_id"
  end

end
