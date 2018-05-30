class SitemapsController < ApplicationController
  def index
    @static_pages = [
      root_url
    ]

    @jobs = Job.active

    respond_to do |format|
      format.xml { render layout: false }
    end
  end
end
