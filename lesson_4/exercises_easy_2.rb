# exercises easy 2

# Question 1
# You are given the following code:
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end
# What is the result of calling
oracle = Oracle.new
oracle.predict_the_future
# it will print 'You will ' with random string from choices array

# Question 2
# We have an Oracle class and a RoadTrip class
# that inherits from the Oracle class.
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end
# What is the result of the following:
trip = RoadTrip.new
trip.predict_the_future
# will print 'You will ' + string from RoadTrip choices method

# Question 3
# How do you find where Ruby will look for a
# method when that method is called? How can
# you find an object's ancestors?
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end
# What is the lookup chain for Orange and HotSauce?
# [Orange, Taste, Object, Kernel, BasicObject]
# I used Orange.ancestors to find out

# Question 4
# What could you add to this class to simplify it
# and remove two methods from the class definition
# while still maintaining the same functionality?
class BeesWax
  attr_accessor :type
  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end
# add attr_accessor

# Question 5
# There are a number of variables listed below.
# What are the different types and how do you
# know which is which?
excited_dog = "excited dog" # => local variable
@excited_dog = "excited dog" # => instance variable
@@excited_dog = "excited dog" # => class variable

# Question 6
# Which one of these is a class method (if any)
# and how do you know? How would you call a class method?
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
# a class method uses self before the method name
# you can call it straight from the class
# Television.manufacturer

# Question 7
# Explain what the @@cats_count variable does and how it works.
# What code would you need to write to test your theory?
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
    puts @@cats_count
  end

  def self.cats_count
    @@cats_count
  end
end
# every time the class is initialized the @@cats_count
# gets incremented by one
# I can test my theory by using
# Cat.cats_count

# Question 8
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# Question 9
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

  def play
    # this would override the SuperClass method
    # looks in the class first, if it is not there then
    # it looks in the SuperClass
  end
end

# Question 10
# What are the benefits of using
# Object Oriented Programming in Ruby?
# Think of as many as you can.
# For organization
# for future proofing the maintenance of code
# grouping context by Nouns
# trying to group code more intuitively
# name spacing
# keeping instances and states of objects
# which can keep code in context
