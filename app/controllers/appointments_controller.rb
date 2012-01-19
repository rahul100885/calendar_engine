class AppointmentsController < ApplicationController
  def index
    events = []
    Appointment.all.each do |event|
      events << event.to_cal_json
    end

    respond_to do |format|
      format.js {
        render :json => events.to_json
      }
    end

  end
end
