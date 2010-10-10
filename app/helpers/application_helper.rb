module ApplicationHelper

  def cancel_link title = 'Cancel'
    return content_tag(:div, link_to(title, session[:return_to], :class => 'cancel'))
  end

end

