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

ActiveRecord::Schema.define(version: 20160615142320) do

  create_table "address_ranges", force: :cascade do |t|
    t.integer  "geocode_id"
    t.integer  "num_start"
    t.integer  "num_end"
    t.boolean  "is_even"
    t.string   "street"
    t.string   "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.boolean  "admin"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "assignment_zones", force: :cascade do |t|
    t.string   "name"
    t.float    "coordinates"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "json_coordinates"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id"

  create_table "geocode_grade_walkzone_schools", force: :cascade do |t|
    t.boolean  "transportation_eligible"
    t.integer  "geocode_id"
    t.integer  "grade_level_id"
    t.integer  "school_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "geocodes", force: :cascade do |t|
    t.integer "assignment_zone_id"
  end

  create_table "grade_level_schools", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "grade_level_id"
    t.string   "grade_number"
    t.string   "hours"
    t.integer  "open_seats"
    t.integer  "first_choice"
    t.integer  "second_choice"
    t.integer  "third_choice"
    t.integer  "fourth_higher_choice"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "mcas_ela_total"
    t.float    "mcas_ela_advanced"
    t.float    "mcas_ela_proficient"
    t.float    "mcas_ela_needsimprovement"
    t.float    "mcas_ela_failing"
    t.integer  "mcas_math_total"
    t.float    "mcas_math_advanced"
    t.float    "mcas_math_proficient"
    t.float    "mcas_math_needsimprovement"
    t.float    "mcas_math_failing"
    t.integer  "mcas_science_total"
    t.float    "mcas_science_advanced"
    t.float    "mcas_science_proficient"
    t.float    "mcas_science_needsimprovement"
    t.float    "mcas_science_failing"
    t.text     "uniform_policy"
  end

  create_table "grade_levels", force: :cascade do |t|
    t.string   "name"
    t.float    "walk_zone_radius"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grade_levels_schools", id: false, force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "grade_level_id"
    t.string   "grade_number"
    t.string   "hours"
    t.integer  "open_seats"
    t.integer  "first_choice"
    t.integer  "second_choice"
    t.integer  "third_choice"
    t.integer  "fourth_higher_choice"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "mcas_ela_total"
    t.float    "mcas_ela_advanced"
    t.float    "mcas_ela_proficient"
    t.float    "mcas_ela_needsimprovement"
    t.float    "mcas_ela_failing"
    t.integer  "mcas_math_total"
    t.float    "mcas_math_advanced"
    t.float    "mcas_math_proficient"
    t.float    "mcas_math_needsimprovement"
    t.float    "mcas_math_failing"
    t.integer  "mcas_science_total"
    t.float    "mcas_science_advanced"
    t.float    "mcas_science_proficient"
    t.float    "mcas_science_needsimprovement"
    t.float    "mcas_science_failing"
    t.text     "uniform_policy"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.integer  "city_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "parcels" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "principals", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "titles"
    t.text     "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_grades", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "grade_level_id"
    t.string   "grade_number"
    t.string   "hours"
    t.integer  "open_seats"
    t.integer  "first_choice"
    t.integer  "second_choice"
    t.integer  "third_choice"
    t.integer  "fourth_higher_choice"
    t.integer  "mcas_reading"
    t.integer  "mcas_math"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "school_grades", ["grade_level_id"], name: "index_school_grades_on_grade_level_id"
  add_index "school_grades", ["school_id"], name: "index_school_grades_on_school_id"

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "features"
    t.string   "address"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "zipcode"
    t.float    "lat"
    t.float    "lng"
    t.string   "email"
    t.string   "phone"
    t.string   "fax"
    t.integer  "students_count"
    t.string   "website"
    t.integer  "org_code"
    t.integer  "teachers_count"
    t.string   "short_name"
    t.integer  "assignment_zone_id"
    t.integer  "neighborhood_id"
    t.string   "early_dismissal_time"
    t.string   "staff_to_student_ratio"
    t.integer  "principal_id"
    t.integer  "parcel_id"
    t.string   "category_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.decimal  "latitude"
    t.decimal  "longitude"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.boolean  "admin"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
