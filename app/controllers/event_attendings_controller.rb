class EventAttendingsController < ApplicationController

  def create
    @event_attendee = User.find(params[:user_id])
    @attended_event = Event.find(params[:event_id])
    @attended_event_id = @attended_event.id
    @event_attendee_id = @event_attendee.id
    @attended_event << @event_attendee.id
    if @eattended_event.save
      redirect_to root_path, notice: "You can attend event #{@attended_event.name}, attend another?"
    else
      redirect_to root_path, alert: "You cannot attend event #{@ttended_event.name}"
  end
end
