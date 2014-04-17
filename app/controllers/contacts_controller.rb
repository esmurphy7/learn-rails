class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(secure_params)
    if @contact.valid?
      # save data and send message
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