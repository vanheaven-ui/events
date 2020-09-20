class SessionsController < ApplicationController

  def new; end

  def create
    @user = User.find_by(name: params[:name])
    session[:user_id] = @user.id

    redirect_to root_url
  end

  def destroy
    session.destroy

    redirect_to root_url
  end

  def welcome; end
end
