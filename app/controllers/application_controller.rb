class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user

  def css(score)
    case score
    when 90..100
      "peterriver"
    when 80...90
      "emerald"
    when 70...80
      "sunflower"
    when 60...70
      "carrot"
    when 50...70
      "pumpkin"
    when 0...50
      "pomegranate"
    end
  end
  
  helper_method :css

  def authorize
  	redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

end
