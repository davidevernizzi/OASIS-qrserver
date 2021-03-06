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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131109153243) do

  create_table "attributes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "atype"
    t.string   "value"
    t.integer  "resource_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "attributes", ["resource_id"], :name => "index_attributes_on_resource_id"

  create_table "badges", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "books", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.integer  "library_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "books", ["library_id"], :name => "index_books_on_library_id"

  create_table "details", :force => true do |t|
    t.string   "kind"
    t.string   "value"
    t.integer  "badge_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "details", ["badge_id"], :name => "index_details_on_badge_id"

  create_table "libraries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "operations", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.integer  "badge_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "operations", ["badge_id"], :name => "index_operations_on_badge_id"

  create_table "presences", :force => true do |t|
    t.text     "created_by"
    t.integer  "value"
    t.integer  "badge_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "presences", ["badge_id"], :name => "index_presences_on_badge_id"

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
