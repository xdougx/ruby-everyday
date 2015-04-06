class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  before_action except:[:sign_in, :authenticate] do 
    loged_in?
  end


  rescue_from Exception do |exception|
    Rails.logger.info exception.message
    Rails.logger.info exception.backtrace.join("\n\r")
    render file: "./public/500.html"
  end

  def loged_in?
    return if request.url["/backoffice"].blank?

    if not session.key?(:user)
      redirect_to(backoffice_authentication_sign_in_path(login: false))
    end
  end

  def current_user
    User.find(session[:user])
  end

  def red_carpet options = {} 
    Redcarpet::Render::HTML.new(options)
  end

end