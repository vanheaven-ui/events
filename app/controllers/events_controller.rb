class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    redirect_to root_path, notice: 'Event successfully created' if @event.save
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @upcoming_events = Event.upcoming_events
    @previous_events = Event.previous_events
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :location)
  end
end
