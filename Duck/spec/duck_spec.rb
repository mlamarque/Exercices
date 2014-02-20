require 'spec_helper'
 
describe Duck do
  before :each do
    @duck = Duck.new
  end
  describe "#init" do
    it "should initiliaze with sex" do
      @duck.sex.should == "M"
      @duckette = Duck.new("F")
      @duckette.sex.should == "F"
    end
  end
  describe "#quak" do
    it "should quak " do
      @duck.quak.should be == "COIN"
    end
  end
  describe "#mute" do
    it "should quak " do
      @duck.mute
      @duck.quak.should be == ""
    end
  end
  
  describe "#mute?" do
    it "should quak " do
      @duck.mute?.should be_false
      @duck.mute
      @duck.mute?.should be_true
    end
  end
  
  describe "#lay" do
    it "should quak " do
      @duck.lay.should be_nil
      @duckette = Duck.new("F")
      @duckette.lay.should be_a_kind_of(Ducking)
    end
  end
  
  describe "#go_pond" do
    it "should go to pond " do
      pond = Pond.new
      @duck.go_pond(pond)
      @duck.in_pond?.should be_true
    end
  end
  
  describe "#go_pond" do
    it "a duck can go out to the pond" do
      pond = Pond.new
      @duck.go_pond(pond)
      @duck.in_pond?.should be_true
      @duck.out_pond
      @duck.in_pond?.should be_false
    end
  end
  
  describe "#in_pond?" do
    it "At the initilisation, the duck is not in a pond" do
      @duck.in_pond?.should be_false
    end
  end
  
  describe "#nb_duck_in_pond" do
    it "shoudl return number of ducks in a pond" do
      
      pond = Pond.new
      pond.nb_duck_in_pond.should be == 0
      @duck.go_pond(pond)
      pond.nb_duck_in_pond.should be == 1
      Duck.new.go_pond(pond)
      pond.nb_duck_in_pond.should be == 2
    end
  end
end
