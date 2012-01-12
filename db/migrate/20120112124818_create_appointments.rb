class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.string :title
      t.string :location
      t.string :show_as
      t.string :mark_as
      t.boolean :all_day
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.text :attendees
      t.string :description
      t.references :calendar

      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
