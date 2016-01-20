# exercises hard 1

# Question 1
class SecretFile
  attr_reader :data

  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end

  def data
    @logger.create_log_entry
    @data
  end
end
# She needs to modify it so that any access
# to data must result in a log entry being generated.
# That is, any call to the class which will result
# in data being returned must first call a
# logging class. The logging class has been supplied
# to Alyssa and looks like the following
class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
  end
end

# Question 2
class WheeledVehicle
  include TrackPerformance

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures along with
    super([20,20], 80, 8.0)
  end
end

class Catamaran < WaterVehicle
  include TrackPerformance

  attr_accessor :propeller_count, :hull_count

  def initialize
    # ... code omitted ...
  end
end

module TrackPerformance
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

# Question 3
class WaterVehicle
  include TrackPerformance

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @km_traveled_per_liter = km_traveled_per_liter
    @liters_of_fuel_capacity = liters_of_fuel_capacity
  end

  def range
    range_by_using_fuel = super
    range_by_using_fuel + 10
  end
end

class MotorBoat < WaterVehicle
  def initialize
    @num_hulls = 1
    @num_propellers = 1
  end
end
