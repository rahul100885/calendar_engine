class CalendarsController < ApplicationController
  
  def index
    @calendars = Calendar.all
  end

  def show
  end
end
