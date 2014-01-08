module Driver
  attr_accessor :has_driver
  
  def add_driver
    @has_driver = true
  end
  
  def has_driver?
    @has_driver || false
  end
end

class Parking
  attr_accessor :cars
  
  def initialize
    @cars = []
  end
  
end
class Car
  extend Driver
  include Driver

  attr_accessor :nb_stop
  attr_accessor :passengers
  attr_accessor :parking

  def initialize(nb = 0)
    @nb_stop = nb
    @passengers = []
    @parking = nil
  end

  def running?
    @running ||= false
  end

  def run
    @running = true
  end

  def stop
    @running = false
    @nb_stop += 1
  end

  def park(parking = nil)
    if parking
      parking.cars << self unless parking.cars.include? self
      @parking = parking
    else
      {:error => "no parking available"}
    end
  end

  def unpark
    if @parking
      @parking.cars.delete(self) if @parking.cars.include? self
      @parking = nil
    else
      {:error => "the car is not park"}
    end
  end

end

class Integer
  def cars
    [Car.new, Car.new, Car.new]
  end
end

class Ford < Car
  
  def brand
    "Ford"
  end
  
  def run
    super
    'boom'
  end
  
end
  
class Renault < Car
  
  def brand
    self.class.to_s
  end
end
