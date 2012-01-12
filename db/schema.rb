# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120112125621) do

  create_table "appointments", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.string   "show_as"
    t.string   "mark_as"
    t.boolean  "all_day"
    t.date     "start_date"
    t.date     "end_date"
    t.time     "start_time"
    t.time     "end_time"
    t.text     "attendees"
    t.string   "description"
    t.integer  "calendar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calendars", :force => true do |t|
    t.string   "name"
    t.string   "cal_type",   :default => "internal"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recurrences", :force => true do |t|
    t.integer  "appointment_id"
    t.string   "repeat_type"
    t.integer  "repeat_index"
    t.string   "days_of_week"
    t.string   "dates_of_month"
    t.string   "months_of_year"
    t.string   "week_number"
    t.integer  "end_by_occurance"
    t.date     "end_by_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reminders", :force => true do |t|
    t.integer  "event_id"
    t.string   "event_type"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "todos", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.string   "priority"
    t.string   "status"
    t.integer  "percentage"
    t.text     "description"
    t.date     "start_date"
    t.date     "due_date"
    t.integer  "calendar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
