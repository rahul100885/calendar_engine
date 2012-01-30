class AppointmentsController < ApplicationController
  def index
    @calendar = Calendar.find(params[:calendar_id])
    if params[:start] && params[:end]
      @appointments = @calendar.appointments.appointments_range(Time.at(params[:start].to_i), Time.at(params[:end].to_i))
    else
      @appointments = @calendar.appointments
    end

    events = []

    @appointments.each do |appointment|
      events << to_event(appointment)
    end

    respond_to do |format|
      format.html
      format.js { render :json => events.to_json }
    end
  end
  
  
  def show
    @calendar = Calendar.find(params[:calendar_id])
    @appointment = @calendar.appointments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @appointment }
    end
  end

  def new
    @calendar = Calendar.find(params[:calendar_id])
    @appointment = @calendar.appointments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @appointment }
    end
  end

  def edit
    @calendar = Calendar.find(params[:calendar_id])
    @appointment = @calendar.appointments.find(params[:id])
  end

  def create
    @appointment = Appointment.new(params[:appointment])

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to(calendar_appointment_path(@appointment.calendar_id, @appointment), :notice => 'Appointment was successfully created.') }
        format.xml  { render :xml => @appointment, :status => :created, :location => @appointment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @appointment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        format.html { redirect_to(calendar_appointment_path(@appointment.calendar_id, @appointment), :notice => 'Appointment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @appointment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to(appointments_url) }
      format.xml  { head :ok }
    end
  end

  private

  def to_event(appointment)
    {:id => appointment.id,
     :title => appointment.title,
     :start => appointment.start_time ? "#{appointment.start_date}T#{appointment.start_time.strftime("%T")}Z" : appointment.start_date,
     :end => appointment.end_time ? "#{appointment.end_date}T#{appointment.end_time.strftime("%T")}Z" : appointment.end_date,
     :allDay => appointment.all_day,
     :url => edit_calendar_appointment_path(appointment.calendar_id, appointment) 
    }
  end
end
