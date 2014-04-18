class ContactsController < ApplicationController
  
  # Display empty contact form
  def new
    @contact = Contact.new
  end

  # Validate and process a submitted form (this method is called when the contact form is submitted)
  def create
    @contact = Contact.new(secure_params)
    if @contact.valid? # Calls Contact model's validation atttributes
      @contact.update_spreadsheet
      # TODO: send message
      flash[:notice] = "Message sent from #{@contact.name}"
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  
  # Screens parameters sent from the browser
  def secure_params
    params.require(:contact).permit(:name, :email, :content) # Ensures that 'params[:contact]' only passes :name, :email, and :content parameters
  end
  
  
end