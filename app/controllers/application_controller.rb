class ApplicationController < ActionController::Base
  protect_from_forgery
  
  after_filter :store_location
  
  def get_layout
    request.xhr? ? nil : 'application'
  end
  
  protected
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  private
  
  def store_location
    session[:return_to] = request.fullpath
  end
  

end

