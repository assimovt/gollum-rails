class Page < ActiveRecord::Base

  acts_as_nested_set

  # Temporarily hard coded
  FORMAT = :textile
  WIKI   = Rails.root.join("db", "wiki.git")


  before_create  :create_page
  before_update  :update_page
  before_destroy :delete_page

  attr_accessor :body, :change_comment

  def content
    page.formatted_data
  end

  def raw_content
    page.raw_data
  end

  def self.welcome
    Page.first(:conditions => {:name => 'Welcome'})
  end

  def author
    page.version.author.name.gsub(/<>/, '')
  end

  def date
    page.version.authored_date
  end

  def preview(data)
    wiki.preview_page('Preview', data, FORMAT).formatted_data
  end


  private

  def wiki
    @@golum ||= Gollum::Wiki.new(WIKI)
  end

  def page
    wiki.page(self.name)
  end

  def create_page
    wiki.write_page(name, FORMAT, body || '', {:message => self.change_comment, :name => 'tester', :author => 'tester'})
  end

  def update_page
    wiki.update_page(page, name, FORMAT, body || self.raw_content, {:message => self.change_comment, :name => 'tester', :author => 'tester'})
  end

  def delete_page
    wiki.delete_page(page, COMMIT)
  end

end
