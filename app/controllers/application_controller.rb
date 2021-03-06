class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :admin?

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def authorize
    if !current_user
      flash[:alert] = "Please sign in to view that page."
      redirect_to '/signup'
    end
  end

  def admin?
    if !current_user
      flash[:alert] = "Please sign in to view that page."
      redirect_to '/signup'
    elsif current_user.admin == false
      flash[:alert] = "Only administrators can see this page."
      redirect_to '/signup'
    end
  end
end
