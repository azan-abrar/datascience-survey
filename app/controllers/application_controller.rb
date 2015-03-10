class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin_only
    access_denied unless current_user && current_user.admin?
  end

  def access_denied
    redirect_to root_path, alert: "Access denied."
  end
end
