class CalendarsController < ApplicationController
  
  def index
  end

  def show
    events = []
    Appointment.all.each { |event|
    events << {:id => event.id, 
               :title => event.title, 
               :start => (event.start_time ? "#{event.start_date}T#{event.start_time.strftime("%T")}Z" : event.start_date) ,
               :end => (event.end_time ? "#{event.end_date}T#{event.end_time.strftime("%T")}Z" : event.end_date) ,
               :allDay => event.all_day}
    }
    render :text => events.to_json 
  end
end
