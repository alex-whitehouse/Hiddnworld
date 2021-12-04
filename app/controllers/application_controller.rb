class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorise
    redirect_to login_url, alert: "Not Authorised" if current_user.nil?
  end

  # def mobile_device?
  #  request.user_agent =~ /mobile|webOS
  #end
  # helper_method :mobile_device?
end
