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

ActiveRecord::Schema.define(version: 20161209092356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "ordering",   default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "title"
    t.string   "name"
    t.string   "mobile_phone"
    t.string   "tel"
    t.string   "ext"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_employees_on_department_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "spec"
    t.string   "quantity"
    t.string   "unit"
    t.string   "image"
    t.integer  "department_id"
    t.integer  "employee_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_items_on_department_id", using: :btree
    t.index ["employee_id"], name: "index_items_on_employee_id", using: :btree
  end

  add_foreign_key "employees", "departments"
  add_foreign_key "items", "departments"
  add_foreign_key "items", "employees"
end
