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

ActiveRecord::Schema.define(version: 2021_11_18_201731) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.float "price"
    t.integer "quantity"
    t.string "author"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "classifications", force: :cascade do |t|
    t.datetime "dateClassify"
    t.integer "book_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_classifications_on_book_id"
    t.index ["category_id"], name: "index_classifications_on_category_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "orderTime"
    t.float "total"
    t.string "shipAddress"
    t.string "orderNum"
    t.float "GST"
    t.float "PST"
    t.float "FST"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.integer "tax"
    t.string "name"
    t.float "GST"
    t.float "PST"
    t.float "FST"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_provinces_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "datePurchase"
    t.float "price"
    t.integer "book_id", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_purchases_on_book_id"
    t.index ["order_id"], name: "index_purchases_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "shipAddress"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "classifications", "books"
  add_foreign_key "classifications", "categories"
  add_foreign_key "orders", "users"
  add_foreign_key "provinces", "users"
  add_foreign_key "purchases", "books"
  add_foreign_key "purchases", "orders"
end