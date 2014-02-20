require 'spec_helper'
 

describe Ducking do
  describe "#quak" do
    it "a Ducking must have quack is lowercase" do
      duck = Ducking.new
      duck.quak.should be == "coin"
    end
  end
end