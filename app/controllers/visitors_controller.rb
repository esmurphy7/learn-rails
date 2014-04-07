class VisitorsController < ApplicationController
  
  def new
    # Any instance variables (@owner) are available to corresponding view files
    @owner = Owner.new
    # render the view at this path, the .html.erb extension is assumed by default
    render "visitors/new"
  end
  
end