class AppointmentsController < ApplicationController
  def index 
    appointments = Appointment.appointments_range(params[:calendar_id], Time.at(params[:start].to_i), Time.at(params[:end].to_i))
    
    events = []

    appointments.each do |event|
      events << event.to_cal_json
    end

    respond_to do |format|
      format.js {
        render :json => events.to_json
      }
    end

  end
end
