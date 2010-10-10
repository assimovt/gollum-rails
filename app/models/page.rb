class Page < ActiveRecord::Base
  
  FORMAT = :textile
  COMMIT = {:message => 'Test commit', :name => 'Test author', :email => 'test@test.com'}
  
  before_create  :create_page
  before_update  :update_page
  before_destroy :delete_page 
  
  attr_accessor :body
  
  def content
    page.formatted_data
  end
  
  def raw_content
    page.raw_data
  end
  
  def self.welcome
    Page.first(:conditions => {:parent_id => 0})
  end
  
  private
  
  def wiki
    @@golum ||= Gollum::Wiki.new(Rails.root.join("tmp", "pages.git"))
  end
  
  def page
    wiki.page(self.name)
  end
  
  def create_page
    wiki.write_page(name, FORMAT, body, COMMIT)
  end
  
  def update_page
    wiki.update_page(page, name, FORMAT, body, COMMIT)
  end
  
  def delete_page
    wiki.delete_page(page, COMMIT)
  end
  
end
