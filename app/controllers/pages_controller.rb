class PagesController < ApplicationController
  
  def show
    @page = Page.find(params[:id] || Page.welcome)
  end
  
  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end

end
