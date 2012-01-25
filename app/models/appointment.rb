class Appointment < ActiveRecord::Base
  belongs_to :calendar
  has_one :recurrence, :dependent => :destroy
  has_many :reminders, :as => :event, :dependent => :destroy

  named_scope :appointments_by_calendar, {:include => :recurrence}
  named_scope :appointments_range,  lambda { |*args| {:include => :recurrence, :conditions => {:start_date => (args[0] .. args[1]) } } }

  def to_cal_json
    {:id => id,
     :title => title,
     :start => start_time ? "#{start_date}T#{start_time.strftime("%T")}Z" : start_date,
     :end => end_time ? "#{end_date}T#{end_time.strftime("%T")}Z" : end_date,
     :allDay => all_day
    }
  end
end
