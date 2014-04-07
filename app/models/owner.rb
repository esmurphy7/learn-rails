class Owner
  
  def name
    name = "Foobar Kadigan"
  end
  
  def birthdate
    birthdate = Date.new(1990, 12, 22)
  end
  
  # 'def' defines a method name,
  # the last value assigned by the last statement is returned (countdown)
  def countdown
    today = Date.today
    birthday = Date.new(today.year, birthdate.month, birthdate.day)
    if birthday > today
      # .to_i converts the result to a whole number
      countdown = (birthday-today).to_i
    else
      countdown = (birthday.next_year-today).to_i
    end
  end
  
end
