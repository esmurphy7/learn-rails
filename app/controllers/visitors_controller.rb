class VisitorsController < ApplicationController
  
  def new
    # Any instance variables (@owner) are available to corresponding view files
    @owner = Owner.new
    # render method is called behind the scenes, renders the view at this path, the .html.erb extension is assumed by default
    # every page in '/app' uses 'application.html.erb' default layout unless specified otherwise
    # ie: Can specify one of:
      # render "visitors/new"
       # render "visitors/new", :layout => false
      # render "visitors/new", :layout => "special"
    # Flash messages
      # flash.now[:notice] = 'Welcome!'
      # flash.now[:alert] = 'My birthday is soon.'
  end
  
end