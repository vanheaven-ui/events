class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @event = @user.created_events.build(event_params)
    @event.save

    redirect_to root_path
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :location)
  end
end
