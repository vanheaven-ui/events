class EventAttendingsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    if @event.event_attendees.include? current_user
      redirect_to event_path(@event), alert: 'You are already attendee'
    else
      @event.event_attendees << current_user
      redirect_to event_path(@event), notice: 'Attendance confirmed'
    end
  end
end
