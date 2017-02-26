class EventAttendanceController < ApplicationController
  def index
  
  end
  
  def new
  
  end
  
  def create
    @event = Event.find(params[:event_attendance][:event])
    @member = Member.find(params[:event_attendance][:member])
    @event.members << @member
	
    redirect_to "/event_attendance/new"
  end
  
end
