class EventAttendingsController < ApplicationController
  def create
    @event = Event.find_by(id: params[:id])
    @event_attending = EventAttending.new(event_id: @event.id, user_id: current_user.id)
    if @event.event_attendees.include? current_user
      flash[:alert] = 'You are already an attendee'
    else
      @event.event_attendees << current_user
      flash[:notice] = 'Attendee list updated!'
    end
  end
end
