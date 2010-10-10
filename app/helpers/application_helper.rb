module ApplicationHelper
  
  def bodytag_id
    "#{@current_controller}_#{@current_action}"
  end

  def cancel_link title = 'Cancel'
    return content_tag(:div, link_to(title, session[:return_to], :class => 'cancel'))
  end
  
end

