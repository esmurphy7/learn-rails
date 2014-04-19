class VisitorsController < ApplicationController
  
  def new
    # Any instance variables (@owner) are available to corresponding view files
    @visitor = Visitor.new
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
  
  # Called when visitor submits their email to a mailing list
  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.valid?
      @visitor.subscribe
      flash[:notice] = "Signed up #{@visitor.email}."
      redirect_to root_path
    else
      render :new
    end
  end
  
  def secure_params
    params.require(:visitor).permit(:email)
  end
  
end