class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  def authenticate_user!
    if !current_user
      redirect_to login_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied"
#exception.message
    redirect_to users_show_path
  end

#rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

#  def record_not_found
#    flash[:alert] = 'Ten rekord nie istnieje'
#    redirect_to action: :index
#  end
end
