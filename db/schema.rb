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

ActiveRecord::Schema.define(version: 20141104015920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "category_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "company_code"
    t.string   "company_name"
    t.string   "contact_name"
    t.string   "contact_title"
    t.string   "address"
    t.string   "city"
    t.string   "region"
    t.string   "postal_code"
    t.string   "country"
    t.string   "phone"
    t.string   "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "title_of_courtesy"
    t.date     "birth_date"
    t.date     "hire_date"
    t.string   "address"
    t.string   "city"
    t.string   "region"
    t.string   "postal_code"
    t.string   "country"
    t.string   "home_phone"
    t.string   "extension"
    t.text     "notes"
    t.integer  "reports_to_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["reports_to_id"], name: "index_employees_on_reports_to_id", using: :btree

  create_table "order_details", force: true do |t|
    t.decimal  "unit_price"
    t.integer  "quantity"
    t.decimal  "discount"
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_details", ["order_id"], name: "index_order_details_on_order_id", using: :btree
  add_index "order_details", ["product_id"], name: "index_order_details_on_product_id", using: :btree

  create_table "orders", force: true do |t|
    t.date     "order_date"
    t.date     "required_date"
    t.date     "shipped_date"
    t.integer  "ship_via_id"
    t.decimal  "freight"
    t.string   "ship_name"
    t.string   "ship_address"
    t.string   "ship_city"
    t.string   "ship_region"
    t.string   "ship_postal_code"
    t.string   "ship_country"
    t.string   "customer_code"
    t.integer  "customer_id"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  add_index "orders", ["employee_id"], name: "index_orders_on_employee_id", using: :btree
  add_index "orders", ["ship_via_id"], name: "index_orders_on_ship_via_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "product_name"
    t.string   "quantity_per_unit"
    t.decimal  "unit_price"
    t.integer  "units_in_stock"
    t.integer  "units_on_order"
    t.integer  "reorder_level"
    t.boolean  "discontinued"
    t.integer  "supplier_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["supplier_id"], name: "index_products_on_supplier_id", using: :btree

  create_table "test", id: false, force: true do |t|
    t.decimal "ya"
    t.decimal "na"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "fb"
    t.string   "insta"
    t.string   "twitter"
    t.string   "password_digest"
    t.string   "handle"
    t.text     "bio"
    t.integer  "ie"
    t.integer  "sn"
    t.integer  "tf"
    t.integer  "pj"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
