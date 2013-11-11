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

ActiveRecord::Schema.define(version: 20131021180340) do

  create_table "feats", force: true do |t|
    t.text     "name"
    t.string   "sub_type"
    t.text     "flavor"
    t.text     "prerequisite"
    t.text     "benefit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feats_races", id: false, force: true do |t|
    t.integer "feat_id", null: false
    t.integer "race_id", null: false
  end

  add_index "feats_races", ["feat_id", "race_id"], name: "index_feats_races_on_feat_id_and_race_id", unique: true

  create_table "races", force: true do |t|
    t.string   "name"
    t.string   "size"
    t.string   "type"
    t.integer  "bonus_feat_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "racial_bonus", force: true do |t|
    t.integer "race_id"
    t.string  "bonus"
  end

  create_table "racial_skill_bonus", force: true do |t|
    t.integer "race_id",  null: false
    t.integer "skill_id"
    t.integer "bonus",    null: false
  end

  add_index "racial_skill_bonus", ["race_id", "skill_id"], name: "index_racial_skill_bonus_on_race_id_and_skill_id", unique: true

  create_table "racial_stat_bonus", force: true do |t|
    t.integer "race_id", null: false
    t.integer "stat_id"
    t.integer "bonus",   null: false
  end

  add_index "racial_stat_bonus", ["race_id", "stat_id"], name: "index_racial_stat_bonus_on_race_id_and_stat_id"

  create_table "skills", force: true do |t|
    t.string   "name"
    t.integer  "stat_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["stat_id"], name: "index_skills_on_stat_id"

  create_table "stats", force: true do |t|
    t.string  "name"
    t.string  "abbreviation"
    t.boolean "is_primary?",  default: false, null: false
  end

end
