class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  skip_before_filter :verify_authenticity_token

private
  def set_locale
  	if params[:hl]
  		session[:locale] = params[:hl]
  	end
		I18n.locale = session[:locale] if session[:locale]
  end
end

