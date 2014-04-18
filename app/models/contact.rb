class Contact < ActiveRecord::Base
  # Disables database features of ActiveRecord from the activerecord-tableless gem
  has_no_table
  # Specifies attributes for the model from the activerecord-tableless gem
  column :name, :string
  column :email, :string
  column :content, :string
  
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :content
  validates_format_of :email,
    :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates_length_of :content, :maximum => 500
  
  # Updates a google drive spreadsheet using Google spreadsheets API from google_drive gem.
  def update_spreadsheet
    # Environment variables are used from config/application.yml with help from figaro gem.
    connection = GoogleDrive.login(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"])
    ss = connection.spreadsheet_by_title("Learn-Rails-Example")
    if ss.nil?
      ss = connection.create_spreadsheet("Learn-Rails-Example")
    end
    ws = ss.worksheets[0] # Spreadsheets contain multiple worksheets
    last_row = 1 + ws.num_rows # Get the row after the bottom-most, non-empty row (last_row)
    ws[last_row, 1] = Time.new # Set row: 'last_row' , column: '1' of worksheet to 'Time.new'
    ws[last_row, 2] = self.name
    ws[last_row, 3] = self.email
    ws[last_row, 4] = self.content
    ws.save
  end
  
end