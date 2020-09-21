class SessionsController < ApplicationController

  def new; end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      session[:user_id] = @user.id

      redirect_to root_url, notice: "Successfully signed in, cheers!"
    else
      render 'new', alert: "Oops! cannot sign in, check and try again or sign up"
    end
  end

  def destroy
    session.destroy

    redirect_to root_url, notice: "Successfully signed out!"
  end

  def welcome
    @upcoming_events = Event.upcoming_events
    @previous_events = Event.previous_events
  end
end
