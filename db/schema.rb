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

ActiveRecord::Schema.define(version: 20190828040007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "compile_cmd"
    t.string "run_cmd"
    t.string "source_file"
  end

  create_table "problem_categories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "problem_data", force: :cascade do |t|
    t.integer  "problem_id"
    t.string   "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problem_id"], name: "index_problem_data_on_problem_id", using: :btree
  end

  create_table "problem_solutions", force: :cascade do |t|
    t.integer  "problem_id"
    t.text     "description"
    t.text     "source_code"
    t.integer  "language_id"
    t.integer  "difficulty"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["language_id"], name: "index_problem_solutions_on_language_id", using: :btree
    t.index ["problem_id"], name: "index_problem_solutions_on_problem_id", using: :btree
  end

  create_table "problems", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "code"
    t.integer  "difficulty"
    t.boolean  "is_public"
    t.integer  "author_id"
    t.integer  "point"
    t.integer  "solve_count"
    t.text     "input_string"
    t.text     "output_string"
    t.bigint   "time_limit"
    t.bigint   "memory_limitz"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.text     "source_code"
    t.integer  "language_id"
    t.text     "stdin"
    t.text     "expected_output"
    t.text     "stdout"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "finished_at"
    t.decimal  "time"
    t.integer  "memory"
    t.text     "stderr"
    t.string   "token"
    t.integer  "number_of_runs"
    t.decimal  "cpu_time_limit"
    t.decimal  "cpu_extra_time"
    t.decimal  "wall_time_limit"
    t.integer  "memory_limit"
    t.integer  "stack_limit"
    t.integer  "max_processes_and_or_threads"
    t.boolean  "enable_per_process_and_thread_time_limit"
    t.boolean  "enable_per_process_and_thread_memory_limit"
    t.integer  "max_file_size"
    t.text     "compile_output"
    t.integer  "exit_code"
    t.integer  "exit_signal"
    t.text     "message"
    t.decimal  "wall_time"
    t.index ["token"], name: "index_submissions_on_token", using: :btree
  end

end
