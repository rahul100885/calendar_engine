class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.string :title
      t.string :location
      t.string :priority
      t.string :status
      t.integer :percentage
      t.text :description
      t.date :start_date
      t.date :due_date
      t.references :calendar

      t.timestamps
    end
  end

  def self.down
    drop_table :todos
  end
end
