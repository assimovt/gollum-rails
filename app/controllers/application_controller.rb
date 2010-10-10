class ApplicationController < ActionController::Base
  protect_from_forgery


  def get_layout
    request.xhr? ? nil : 'application'
  end
  

end

