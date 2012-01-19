class Appointment < ActiveRecord::Base
  belongs_to :calendar
  has_one :recurrence
  has_many :reminders, :as => :event

  def to_cal_json
    {:id => id,
     :title => title,
     :start => start_time ? "#{start_date}T#{start_time.strftime("%T")}Z" : start_date,
     :end => end_time ? "#{end_date}T#{end_time.strftime("%T")}Z" : end_date,
     :allDay => all_day
    }
  end
end
