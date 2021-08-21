class UsersController < ApplicationController
    before_action :authorize, only: [:delete, :update, :patch, :index]
    before_action :admin?, only: [:delete]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've successfully signed up!"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to '/signup'
    end
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User successfully deleted!"
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end