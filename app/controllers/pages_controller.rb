class PagesController < ApplicationController

  layout :get_layout

  before_filter :find_page, :except => [:new, :show, :create]
  before_filter :find_body, :only => [:edit]

  def new
    @page = Page.new
  end

  def edit
  end

  def show
    @page = Page.find(params[:id] || Page.welcome)
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Successfully created page."
      redirect_to @page
    else
      render :action => 'new'
    end
  end

  def update
    if @page.update_attributes(params[:page])
      flash[:notice] = "Successfully updated page."
      redirect_to @page
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page.destroy
    flash[:notice] = "Successfully destroyed page."
  end

  def preview
    render :text => @page.preview(params[:data])
  end

  private

  def find_page
    @page = Page.find(params[:id])
  end

  def find_body
    @page.body = params[:page][:body] rescue @page.raw_content
  end

end
