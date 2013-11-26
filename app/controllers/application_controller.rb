class ApplicationController < ActionController::Base
  include Clearance::Controller

  before_filter :find_mimiced_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @_current_user ||= super

    if @_current_user.present? && @_current_user.admin? && @mimiced_user.present?
      @_current_user = @mimiced_user

      flash[:notice] = "Warning: Currently controlling user_id #{@mimiced_user.id}"
    end

    @_current_user
  end

  def require_session
    redirect_to(sign_in_path) unless signed_in?
  end

  private

  def find_mimiced_user
    if session[:mimiced_user_id].present?
      @mimiced_user = User.find(session[:mimiced_user_id])
    end
  end
end
