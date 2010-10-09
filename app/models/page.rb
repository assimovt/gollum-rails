class Page < ActiveRecord::Base
  
  MAX_DEPTH = 5
  
  def content
    page.formatted_data
  end
  
  #def self.index(parent_id = 0, pages = [])
  #  parent = Page.find(parent_id)
  #  _pages = parent.children
  #end
  

  def index
    
  end
  
  def self.welcome
    Page.first(:conditions => {:parent_id => 0})
  end
  
  private
  
  def page
    @@golum ||= Gollum::Wiki.new(Rails.root.join("tmp", "pages.git"))
    @@golum.page(self.name)
  end
  
  
end
