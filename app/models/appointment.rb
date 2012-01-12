class Appointment < ActiveRecord::Base
  belongs_to :calendar
  has_one :recurrence
  has_many :reminders, :as => :event
end
