class RubyExample < Object
  
  # Class attributes
  # ':horriffic' is an immutable variable (symbol)
  # 'attr_accessor' is shortcut for writing getters and setters
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
    # equivalent to: condition ? value_if_true : value_if_false
    @date = date.nil? ? Date.today : date
  end
  
  def titled_name
    # Equivalent to: if not @horrific then 'Esteemed'
    @honorific ||= 'Esteemed'
    # Hashmark indicates expression should be treated as a string
    titled_name = "#{@honorific} #{@name}"
  end
  
  private
  def famous_birthdays
    # Initialize hash data structure by using curly braces
    birthdays = {
      'Ludwig van Beethoven' => Date.new(1770,12,16),
      'Dave Brubeck' => Date.new(1920,12,6),
      'Buddy Holly' => Date.new(1936,9,7),
      'Keith Richards' => Date.new(1943,12,18)
    }
  end
  
  def december_birthdays
    born_in_december = [ ]
    # The pipes assign the key and value of the hash to two variables
    for famous_birthdays.each do |name, date|
      if date.month == 12
        # Insert 'name' key into the array
        born_in_december << name
      end
    end
    born_in_december
  end
  
end