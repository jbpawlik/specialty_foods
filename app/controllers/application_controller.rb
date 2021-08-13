class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authorize, only: [:secret]

  def secret
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id]) 
    end
  end

  def authorize
    if !current_user
      flash[:alert] = "Please sign in to view that page."
      redirect_to '/products'
    end
  end

end
