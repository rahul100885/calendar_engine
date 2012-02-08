class Appointment < ActiveRecord::Base
  belongs_to :calendar
  has_one :recurrence, :dependent => :destroy
  has_many :reminders, :as => :event, :dependent => :destroy

  named_scope :appointments_by_calendar, {:include => :recurrence}
  named_scope :appointments_range,  lambda { |*args| {:include => :recurrence, :conditions => {:start_date => (args[0] .. args[1]) } } }
  
  def to_ri_cal
    RiCal.Event do |cal_event|
      #cal_event.uid = id
      #debugger
      cal_event.summary = title
      cal_event.description = description if description
      cal_event.dtstart = (all_day? ? start_date.to_date : "#{start_date.strftime("%Y%m%d")}T#{start_time.strftime("%H%M%S")}") if start_date
      cal_event.dtend = (all_day? ? end_date.to_date : "#{end_date.strftime("%Y%m%d")}T#{end_time.strftime("%H%M%S")}") if end_date
      #cal_event.url = url if url
      #cal_event.rrules = recurrence_rules.map(&:to_ical) if recurrence_rules.any?
      cal_event.location = location if location
    end
  end

end
