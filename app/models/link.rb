class Link < ActiveRecord::Base
	attr_accessor :name
	attr_accessor :url
  
  validates_presence_of :name
  validates_presence_of :url
  
  def updateDB
    
  end
end
