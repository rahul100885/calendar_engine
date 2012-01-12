class CreateRecurrences < ActiveRecord::Migration
  def self.up
    create_table :recurrences do |t|
      t.references :appointment
      t.string :repeat_type
      t.integer :repeat_index
      t.string :days_of_week
      t.string :dates_of_month
      t.string :months_of_year
      t.string :week_number
      t.integer :end_by_occurance
      t.date :end_by_date

      t.timestamps
    end
  end

  def self.down
    drop_table :recurrences
  end
end
