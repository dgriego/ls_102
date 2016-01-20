# exercises medium 1

# Question 1
class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end
# works for the method >=
# wouldn't work for += because it a reassignment

# Question 2
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end
# will fail because there is no setter method
# need attr_write as well

# Question 3
class InvoiceEntry
  attr_accessor :product_name
  attr_reader :quantity

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    @quantity = updated_count if updated_count >= 0
  end
end
# add attr_accessor exposes the @quantity variable
# allowing it to be changed without using the
# update_quantity method

# Question 4
class Greeting
  def greet(str)
    puts str
  end
end

class Hello > Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye > Greeting
  def bye
    greet("Goodbye")
  end
end

# Question 5
class KrispyKreme
  attr_reader :filling_type

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    filling_type
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")
# Write additional code for KrispyKreme such that
# the puts statements will work as specified above.

# Question 6
# nothing is different functionally

# Question 7
# How could you change the method name below
# so that the method name is more clear and less repetitive.
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    "I want to turn on the light with a brightness " \
    "level of super high and a colour of green"
  end
end
# remove light from the method
