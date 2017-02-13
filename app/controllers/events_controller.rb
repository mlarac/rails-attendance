class EventsController < ApplicationController
  def new
    respond_to do |format|
      format.js
    end
  end
  
  def index
    @events = Event.all
	respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def edit
    @event = Event.find(params[:id])
	respond_to do |format|
      format.js
    end
  end
  
  def create
    @event = Event.new(event_params)
    @event.save
	
	@events = Event.all
    redirect_to "/events/"
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to "/events/"
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
    def event_params
      params.require(:event).permit(:name, :start_time, :end_time, :venue)
    end
end
