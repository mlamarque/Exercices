require 'spec_helper'
 
describe Car do
  before :each do
    @car = Car.new
  end
  describe "#init" do
    it "should init car" do
      @car.running?.should be_false
    end
  end
  describe "#run" do
    it "should run a car" do
      @car.run
      @car.running?.should be_true
    end
  end
  describe "#stop" do
    it "should stop a car" do
      @car.run
      @car.stop
      @car.running?.should be_false
    end
  end
  describe "#nb_stop" do
    it "should stop a car" do
      @car.run
      @car.stop
      @car.nb_stop.should be == 1
      @car.run
      @car.stop
      @car.nb_stop.should be == 2
    end
  end
  describe "#initialize" do
    it "should initialize a car" do
      car = Car.new(3)
      car.nb_stop.should be == 3
      car.run
      car.stop
      car.nb_stop.should be == 4
    end
  end
  describe "park" do
    it "should park a car" do
      parking = Parking.new
      @car.park(parking)
      parking.cars.size.should be == 1
      @car.parking.should be == parking
    end
  end
  describe "unpark" do
    it "should unpark a car" do
      parking = Parking.new
      @car.park(parking)
      parking.cars.size.should be == 1
      @car.parking.should be == parking
      @car.unpark
      parking.cars.size.should be == 0
      @car.parking.should be_nil
    end
    it "should render error if no parking" do
      parking = Parking.new
      @car.unpark.should be_an_instance_of Hash
      @car.unpark.keys.should include(:error)
    end
  end
end

# describe Parking do
#   describe "#init" do
#     it "should init a parking" do
#       @parking = Parking.new
#       @parking.cars.should be_empty
#     end
#   end
# end
# 
# 
# describe Ford do
#   describe "#init" do
#     it "should init a brand" do
#       ford = Ford.new
#       ford.brand.should be == "Ford"
#     end
#   end
#   
#   describe "#module driver" do
#     it "should load driver module" do
#       Ford.ancestors.should include Driver
#     end
#   end
#   describe "#add_driver" do
#     it "should add a driver" do
#       ford = Ford.new
#       ford.has_driver?.should be_false
#       ford.add_driver
#       ford.has_driver?.should be_true
#     end
#   end
#   
# end
# 
# describe Renault do
#   describe "#init" do
#     it "should init a brand" do
#       renault = Renault.new
#       renault.brand.should be == "Renault"
#     end
#   end
#   describe "#module driver" do
#     it "should load driver module" do
#       Ford.ancestors.should include Driver
#     end
#   end
#   describe "#add_driver" do
#     it "should add a driver" do
#       renault = Renault.new
#       renault.has_driver?.should be_false
#       renault.add_driver
#       renault.has_driver?.should be_true
#     end
#   end
# end