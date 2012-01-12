class CreateReminders < ActiveRecord::Migration
  def self.up
    create_table :reminders do |t|
      t.references :event, :polymorphic => true
      t.integer :duration

      t.timestamps
    end
  end

  def self.down
    drop_table :reminders
  end
end
