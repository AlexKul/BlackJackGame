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

ActiveRecord::Schema.define(version: 20161026024126) do

  create_table "black_jack_sessions", force: :cascade do |t|
    t.integer  "player_total", default: 0
    t.integer  "dealer_total", default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "dealers", force: :cascade do |t|
    t.string   "name",       default: "unknown"
    t.integer  "wins",       default: 0
    t.integer  "losses",     default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "expression_of_interests", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "contact_name",             null: false
    t.string   "contact_position"
    t.string   "contact_phone",            null: false
    t.string   "contact_email",            null: false
    t.string   "organization_website",     null: false
    t.text     "organization_description", null: false
    t.text     "project_description",      null: false
  end

  create_table "project_evaluations", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "contact_name",              null: false
    t.string   "organization_name"
    t.string   "project_title",             null: false
    t.text     "quality_assesment",         null: false
    t.text     "student_learning",          null: false
    t.text     "team_feedback",             null: false
    t.text     "additional_team_feedback",  null: false
    t.string   "pass_on_send",              null: false
    t.string   "pass_comments",             null: false
    t.text     "enhance_development",       null: false
    t.integer  "progress_reports_rating"
    t.integer  "project_workplan_rating"
    t.integer  "peste_analysis_rating"
    t.integer  "poster_conferenece_rating"
    t.integer  "contact_via_email_rating"
    t.integer  "project_report_rating"
    t.integer  "weekly_meetings_rating"
    t.integer  "other_comment_rating"
    t.text     "other_comment",             null: false
    t.text     "organization_suggestions",  null: false
    t.text     "future_issues",             null: false
    t.string   "another_project",           null: false
    t.text     "another_project_comments",  null: false
  end

  create_table "student_rankings", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "student_name",               null: false
    t.string   "student_email",              null: false
    t.string   "student_school",             null: false
    t.string   "student_program_select",     null: false
    t.string   "student_program_text_field"
    t.string   "rank_1",                     null: false
    t.string   "rank_2",                     null: false
    t.string   "rank_3",                     null: false
    t.string   "rank_4",                     null: false
    t.string   "rank_5",                     null: false
    t.text     "student_skills"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "program",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table_games", force: :cascade do |t|
    t.integer  "wins",       default: 0
    t.integer  "losses",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name",                   default: "", null: false
    t.string   "password_digest",                     null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
