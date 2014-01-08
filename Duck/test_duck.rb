require 'duck'
require 'test/unit'

class DuckTest < Test::Unit::TestCase

  # Create a Duck class with a parameter(sex)
  # default is a male.
  def test_initialize
    duck = Duck.new
    assert_equal 'M', duck.sex
    duck = Duck.new('F')
    assert_equal 'F', duck.sex
  end

  # A duck can quakUn canard peut cancaner (quak)
  def test_quack
    duck = Duck.new
    assert_equal 'COIN', duck.quak
  end

  #If you close the beak's duck,
  # It can not quack
  def test_mute
    duck = Duck.new
    duck.mute
    assert_equal '', duck.quak
  end

  # The duck mute or not?
  def test_mute?
    duck = Duck.new
    assert !duck.mute?
    duck.mute
    assert duck.mute?
  end

  # Add a lay method(the method must initialize a duckling)
  def test_lay
    duck = Duck.new('F')
    assert duck.lay.kind_of?(Ducking)
    assert duck.lay.class.ancestors.include?(Duck)
  end

  # A male duck can not lay, only the woman can
  def test_lay_male
    duck = Duck.new
    assert_equal nil, duck.lay
  end

  # a duck can go to the pond
  def test_go_pond
    duck = Duck.new
    duck.go_pond
    assert duck.in_pond?
  end

  # a duck can go out to the pond
  def test_go_pond
    duck = Duck.new
    duck.go_pond
    assert duck.in_pond?
    duck.out_pond
    assert !duck.in_pond?
  end

  # At the initilisation, the duck is not in a pond
  def test_in_pond
    duck = Duck.new
    assert !duck.in_pond?
  end

  # how many duck in a pond?
  def test_nb_duck_in_pond
    nb_duck = Duck.nb_duck_in_pond
    duck = Duck.new
    assert_equal nb_duck, Duck.nb_duck_in_pond
    duck_1 = Duck.new
    assert_equal nb_duck, Duck.nb_duck_in_pond
    duck_1.go_pond
    assert_equal (nb_duck + 1), Duck.nb_duck_in_pond
    duck.go_pond
    assert_equal (nb_duck + 2), Duck.nb_duck_in_pond
    duck.out_pond
    assert_equal (nb_duck + 1), Duck.nb_duck_in_pond
  end

end

class DuckingTest < Test::Unit::TestCase

  # a Duckling must have quack is lowercase
  def test_lay
    duck = Ducking.new
    assert_equal 'coin', duck.quak
  end
end
