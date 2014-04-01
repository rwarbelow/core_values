class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  private

  def current_user?

  end
  helper_method :current_user?

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
    end
  end

  helper_method :current_user

  def css(score)
    case score
    when 4.5..5
      "peterriver"
    when 4...4.5
      "emerald"
    when 3.5...4
      "sunflower"
    when 3...3.5
      "carrot"
    when 2...3
      "pumpkin"
    when 0...2
      "pomegranate"
    end
  end

  helper_method :css

  def authorize
   redirect_to login_url, alert: "Not authorized" if current_user.nil?
 end

end
