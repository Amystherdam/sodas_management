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

ActiveRecord::Schema.define(version: 2020_09_13_235406) do

  create_table "sodas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "brand"
    t.string "category"
    t.string "flavor"
    t.integer "capacity"
    t.decimal "price", precision: 6, scale: 2
    t.integer "quantiti"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand", "capacity", "flavor"], name: "index_sodas_on_brand_and_capacity_and_flavor", unique: true
  end

end
