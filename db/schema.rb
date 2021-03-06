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

ActiveRecord::Schema.define(version: 20160225172738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "image_path"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "career_passing_stats", force: :cascade do |t|
    t.integer  "year"
    t.string   "team"
    t.integer  "games_played"
    t.integer  "completions"
    t.integer  "passing_attempts"
    t.integer  "passing_yards"
    t.integer  "passing_touchdowns"
    t.integer  "three_hundred_plus"
    t.integer  "rushing_attempts"
    t.integer  "rushing_yards"
    t.integer  "rushing_touchdowns"
    t.decimal  "fantasy_points"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "nfl_player_id"
    t.integer  "interceptions"
    t.float    "completion_percentage"
    t.float    "yards_per_attempt"
    t.float    "yards_per_game"
  end

  add_index "career_passing_stats", ["nfl_player_id"], name: "index_career_passing_stats_on_nfl_player_id", using: :btree

  create_table "career_receiving_stats", force: :cascade do |t|
    t.integer  "year"
    t.string   "team"
    t.integer  "games_played"
    t.integer  "targets"
    t.integer  "receptions"
    t.integer  "receiving_yards"
    t.integer  "hundred_plus"
    t.integer  "receiving_touchdowns"
    t.integer  "rushing_attempts"
    t.integer  "rushing_yards"
    t.integer  "rushing_touchdowns"
    t.decimal  "fantasy_points"
    t.decimal  "ppr_fantasy_points"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "nfl_player_id"
    t.float    "yards_per_game"
    t.float    "yards_per_reception"
  end

  add_index "career_receiving_stats", ["nfl_player_id"], name: "index_career_receiving_stats_on_nfl_player_id", using: :btree

  create_table "career_rushing_stats", force: :cascade do |t|
    t.integer  "year"
    t.string   "team"
    t.integer  "games_played"
    t.integer  "rushing_attempts"
    t.integer  "rushing_yards"
    t.integer  "hundred_plus"
    t.integer  "rushing_touchdowns"
    t.integer  "targets"
    t.integer  "receptions"
    t.integer  "receiving_yards"
    t.integer  "receiving_touchdowns"
    t.decimal  "fantasy_points"
    t.decimal  "ppr_fantasy_points"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "nfl_player_id"
    t.float    "yards_per_game"
    t.float    "yards_per_carry"
  end

  add_index "career_rushing_stats", ["nfl_player_id"], name: "index_career_rushing_stats_on_nfl_player_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "nfl_players", force: :cascade do |t|
    t.string   "name"
    t.string   "college"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "nfl_team_id"
    t.string   "image_path"
    t.string   "position"
    t.date     "date_of_birth"
    t.string   "height"
    t.integer  "weight"
    t.string   "slug"
    t.integer  "rank"
  end

  add_index "nfl_players", ["nfl_team_id"], name: "index_nfl_players_on_nfl_team_id", using: :btree
  add_index "nfl_players", ["slug"], name: "index_nfl_players_on_slug", unique: true, using: :btree

  create_table "nfl_teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "image_path"
    t.string   "slug"
    t.string   "abbreviation"
  end

  add_index "nfl_teams", ["slug"], name: "index_nfl_teams_on_slug", unique: true, using: :btree

  create_table "passing_game_logs", force: :cascade do |t|
    t.integer  "week"
    t.date     "date"
    t.string   "opponent"
    t.integer  "completions"
    t.integer  "passing_attempts"
    t.integer  "passing_yards"
    t.integer  "passing_touchdowns"
    t.integer  "interceptions"
    t.integer  "rushing_attempts"
    t.integer  "rushing_yards"
    t.integer  "rushing_touchdowns"
    t.decimal  "fantasy_points"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "nfl_player_id"
    t.integer  "season"
  end

  add_index "passing_game_logs", ["nfl_player_id"], name: "index_passing_game_logs_on_nfl_player_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "topic_id"
    t.float    "rank"
  end

  add_index "posts", ["topic_id"], name: "index_posts_on_topic_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "receiving_game_logs", force: :cascade do |t|
    t.integer  "season"
    t.integer  "week"
    t.date     "date"
    t.string   "opponent"
    t.integer  "targets"
    t.integer  "receptions"
    t.integer  "receiving_yards"
    t.integer  "receiving_touchdowns"
    t.integer  "rushing_attempts"
    t.integer  "rushing_yards"
    t.integer  "rushing_touchdowns"
    t.decimal  "fantasy_points"
    t.decimal  "ppr_fantasy_points"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "nfl_player_id"
  end

  add_index "receiving_game_logs", ["nfl_player_id"], name: "index_receiving_game_logs_on_nfl_player_id", using: :btree

  create_table "rushing_game_logs", force: :cascade do |t|
    t.integer  "season"
    t.integer  "week"
    t.date     "date"
    t.string   "opponent"
    t.integer  "rushing_attempts"
    t.integer  "rushing_yards"
    t.integer  "rushing_touchdowns"
    t.integer  "receptions"
    t.integer  "receiving_yards"
    t.integer  "receiving_touchdowns"
    t.decimal  "fantasy_points"
    t.decimal  "ppr_fantasy_points"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "nfl_player_id"
    t.integer  "targets"
  end

  add_index "rushing_game_logs", ["nfl_player_id"], name: "index_rushing_game_logs_on_nfl_player_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_path"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["post_id"], name: "index_votes_on_post_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "comments", "posts"
  add_foreign_key "votes", "posts"
  add_foreign_key "votes", "users"
end
