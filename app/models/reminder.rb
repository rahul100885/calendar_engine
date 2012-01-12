class Reminder < ActiveRecord::Base
  belongs_to :event, :polymorphic => true
end
