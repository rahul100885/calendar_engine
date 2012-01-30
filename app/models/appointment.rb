class Appointment < ActiveRecord::Base
  belongs_to :calendar
  has_one :recurrence, :dependent => :destroy
  has_many :reminders, :as => :event, :dependent => :destroy

  named_scope :appointments_by_calendar, {:include => :recurrence}
  named_scope :appointments_range,  lambda { |*args| {:include => :recurrence, :conditions => {:start_date => (args[0] .. args[1]) } } }

end
