class PublicController < ApplicationController
  layout "public"

  before_action :setup_navigation

  def index
    #just an intro to site
  end

  def show
    @page = Page.visible.where(permalink: params[:permalink]).first
    if @page.nil?
      redirect_to root_path
      #redirect_to (action: 'index')
    end
  end

  private

  def setup_navigation
    @subjects = Subject.visible.sorted
  end
end
