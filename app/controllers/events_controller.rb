class EventsController < ApplicationController
  def new
  end
  
  def index
    redirect_to "/events/" + Event.last.id.to_s
  end
  
  def show
    @event = Event.find(params[:id])
	respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def edit
    @event = Event.find(params[:id])
	@events = Event.all
	respond_to do |format|
      format.js
    end
  end
  
  def create
    @event = Event.new(eventNew_params)
    @event.save
	redirect_to "/events/" + @event.id.to_s
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to "/events/" + @event.id.to_s
    else
      render 'edit'
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to "/events/"
  end
  
 private
    def eventNew_params
      params.require(:eventNew).permit(:name, :start_time, :end_time, :venue)
    end
    def event_params
      params.require(:event).permit(:name, :start_time, :end_time, :venue)
    end
end
