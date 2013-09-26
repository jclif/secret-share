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

ActiveRecord::Schema.define(:version => 20130926141222) do

  create_table "friendships", :force => true do |t|
    t.integer  "stalker_id", :null => false
    t.integer  "victim_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "friendships", ["stalker_id"], :name => "index_friendships_on_stalker_id"
  add_index "friendships", ["victim_id"], :name => "index_friendships_on_victim_id"

  create_table "secrets", :force => true do |t|
    t.string   "title",        :null => false
    t.integer  "author_id",    :null => false
    t.integer  "recipient_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "secrets", ["author_id"], :name => "index_secrets_on_author_id"
  add_index "secrets", ["recipient_id"], :name => "index_secrets_on_recipient_id"

  create_table "users", :force => true do |t|
    t.string   "username",        :null => false
    t.string   "password_digest", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "session_token",   :null => false
  end

  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end