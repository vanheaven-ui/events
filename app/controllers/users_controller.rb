class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: 'You have signed up succesfully, please sign in'
    else
      render 'new', alert: 'Sign up failed, Please check and try again'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)

      redirect_to user_path(@user), notice: 'Details updated successfully'
    else
      render 'edit', alert: 'Cannot update, check your entry'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
