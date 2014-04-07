class RubyExample < Object
  
  # Class attributes
  attr_accessor :honorific
  attr_accessor :name
  attr_accessor :date
  
  # Override Object's toString method
  def to_s
    @name
  end
  
  # Constructor
  def initialize(name,date)
    @name = name
    # '?' indicates that the method will return a boolean value
    @date = date.nil? ? Date.today : date
  end
  
  def titled_name
    @honorific ||= 'Esteemed'
    titled_name = "#{@honorific} #{@name}"
  end
  
  private
  def famous_birthdays
    # Initialize dictionary data structure
    birthdays = {
      'Ludwig van Beethoven' => Date.new(1770,12,16),
      'Dave Brubeck' => Date.new(1920,12,6),
      'Buddy Holly' => Date.new(1936,9,7),
      'Keith Richards' => Date.new(1943,12,18)
    }
  end
  
  def december_birthdays
    born_in_december = [ ]
    for famous_birthdays.each do |name, date|
      if date.month == 12
        # Insert 'name' attribute into the array
        born_in_december << name
      end
    end
    born_in_december
  end
  
end