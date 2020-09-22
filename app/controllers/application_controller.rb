class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :signed_in?
  helper_method :new_event

  def current_user
    User.find_by(id: session[:user_id])
  end

  def signed_in?
    current_user
  end

  def new_event
    if signed_in?
      redirect_to new_event_path
    else
      redirect_to root_path, alert: "You must login first"
    end
  end
end
