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
  
end