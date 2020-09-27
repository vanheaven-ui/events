class EventAttendingsController < ApplicationController
  def  new; end

  def create
    @event_attending = EventAttending.new(event_id: attending_params[:event_id], user_id: current_user.id)
    if @event_attending.save
      redirect_to root_path, notice: 'Attendance confirmed'
    else
      redirect_to root_path, alert: 'Unable to confirm, Feature under construction. Use console'
    end
  end

  private

  def attending_params
    params.require(:event_attending).permit(:event_id)
  end
end
