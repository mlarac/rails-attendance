class EventAttendanceController < ApplicationController
  def index
  
  end
  
  def new

  end
  
  def edit
    @event = Event.find(params[:id])
    @present = @event.members.map{ |u| [ u.name, u.id ] }
    @presentID = @event.members.map(&:id)
    @absent = Member.where.not(id: @presentID).map{ |u| [ u.name, u.id ] }
    respond_to do |format|
      format.js
    end
  end
    
  def create
    @event = Event.find(params[:event_attendance][:event])
    params[:event_attendance][:absent].each do |p|
      if p != ""
        @member = Member.find(p)
        @event.members << @member
      end
    end
    #redirect_to "/events/"
  end
  
  def remove
    @event = Event.find(params[:event_attendance][:event])
    params[:event_attendance][:present].each do |p|
      if p != ""
        @member = Member.find(p)
        @event.members.delete(@member)
      end
    end
    #redirect_to "/events/"
  end
end
