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

ActiveRecord::Schema.define(:version => 20150208182952) do

  create_table "committees", :force => true do |t|
    t.string   "name"
    t.string   "logo_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "committees_voivodeships", :force => true do |t|
    t.integer  "voivodeship_id"
    t.integer  "committee_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "committees_voivodeships", ["committee_id"], :name => "index_committees_voivodeships_on_committee_id"
  add_index "committees_voivodeships", ["voivodeship_id"], :name => "index_committees_voivodeships_on_voivodeship_id"

  create_table "constituencies", :force => true do |t|
    t.integer  "entitled"
    t.integer  "invalid_votes"
    t.integer  "valid_votes"
    t.integer  "given_cards"
    t.integer  "empty_cards"
    t.integer  "multiple_choice"
    t.integer  "other_invalid"
    t.integer  "voivodeship_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "constituencies", ["voivodeship_id"], :name => "index_constituencies_on_voivodeship_id"

  create_table "voivodeships", :force => true do |t|
    t.string   "name"
    t.integer  "mandates"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "amount"
    t.integer  "constituency_id"
    t.integer  "committee_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "votes", ["committee_id"], :name => "index_votes_on_committee_id"
  add_index "votes", ["constituency_id"], :name => "index_votes_on_constituency_id"

end
