# exercises easy 1

# Question 1
# Which of the following are objects in Ruby?
# If they are objects, how can you find out
# what class they belong to?
true.class
"hello".class
[1, 2, 3, 'happy days'].class
142.class

# Question 2
# If we have a Car class and a Truck class and
# we want to be able to go_fast, how can we add
# the ability for them to go_fast using the module Speed.
# How can you check if your Car or Truck can now go fast?
module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

# Question 3
# In the last question we had a module called Speed
# which contained a go_fast method. We included this
# module in the Car class as shown below.
module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end
# because we are using self and self refers to the calling object
# interpolation calls to_s for us

# Question 4
# If we have a class AngryCat how do we create a
# new instance of this class?
# The AngryCat class might look something like this:
class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end
AngryCat.new

# Question 5
# Which of these two classes has an instance
# variable and how do you know?
class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end
# the Pizza class has an instance variable because of the @

# Question 6
# What could we add to the class below to
# access the instance variable @volume?
class Cube
  attr_reader :volume
  def initialize(volume)
    @volume = volume
  end

  # or

  def get_volume
    @volume
  end
end

# Question 7
# What is the default thing that Ruby will print
# to the screen if you call to_s on an object?
# Where could you go to find out if you want to be sure?
# ANSWER
# By default if you call to_s you will
# be telling Ruby to print the object’s class
# and an encoding of the object id to the console.

# Question 8
# You can see in the make_one_year_older method
# we have used self. What does self refer to here?
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
# the use of self is referring to the instance of the object
# the calling object

# Question 9
# If we have a class such as the one below:
# In the name of the cats_count method we have used self.
# What does self refer to in this context?
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# self in this instance is referring to the class
# self.method is creating a class method

# Question 10
# If we have the class below, what would you need
# to call to create a new instance of this class.
class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

Bag.new('white', 'cotton')
