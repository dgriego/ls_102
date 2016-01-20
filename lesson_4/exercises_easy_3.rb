# exercises easy 3

# Question 1
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.hi
# will print "Hello"

hello = Hello.new
hello.bye
# will throw no method error

hello = Hello.new
hello.greet
# will throw an error saying it needs an argument

hello = Hello.new
hello.greet("Goodbye")
# will print Goodbye

Hello.hi
# will print an error because it is not a class method

# Question 2
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    Greeting.new.greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
# bye adding self before hi

# Question 3
# When objects are created they are a separate
# realization of a particular class.
# Given the class below, how do we create two
# different instances of this class,
# both with separate names and ages?
class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end
AngryCat.new(23, 'dan')
AngryCat.new(64, 'steve')

# Question 4
# Given the class below, if we created a new instance of
# the class and then called to_s on that instance
# we would get something like "#<Cat:0x007ff39b356d30>"
class Cat
  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{@type} cat"
  end
end
# How could we go about changing the to_s output
# on this method to look like this: I am a tabby cat?
# (this is assuming that "tabby" is the type we passed
#   in during initialization).
# override the to_s method

# Question 5
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer # => manufacture is a class method not an instance method
tv.model # will return whatever the model method does

Television.manufacturer # Will run the manufacture method
Television.model # error, no class method name model

# Question 6
# In the make_one_year_older method we have used self
# What is another way we could write this method
# so we don't have to use the self prefix.
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

# Question 7
# What is used in this class but doesn't add any value?
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end
# the return

