class EventAttendingsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @event.event_attendees << @user
    redirect_to event_path(@event), notice: 'Attendee added' if @event.save
  end
end
