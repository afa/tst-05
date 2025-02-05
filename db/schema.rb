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

ActiveRecord::Schema[8.0].define(version: 2025_01_31_161025) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "interests", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_interests_on_name", unique: true
  end

  create_table "skils", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_skils_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.string "surname"
    t.string "patronymic"
    t.integer "age"
    t.string "nationality"
    t.string "country"
    t.string "gender"
    t.string "full_name"
    t.index ["email"], name: "index_users_on_email"
  end
end
