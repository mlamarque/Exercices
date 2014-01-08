class Ponds
  attr_accessor :ducks
  
  def initialize
    @ducks = []
  end
  
end
class Duck
	def initialize(s = 'M')
		@sex = s
		@pond = nil
	end
	
	def sex
		@sex
	end
	
	def quak
		@muting = false
		@cry || 'COIN'
	end
	
	def mute
		@muting = true
		@cry = ''
	end
	
	def mute?
		@muting
	end
	
	def lay
		@sex == 'M' ? nil : true
	end
	
	def go_pond(pond = nil)
    if pond
      pond.ducks << self unless pond.ducks.include? self
      @pond = pond
    else
      {:error => "no pond available"}
    end
	end
	
	def in_pond?
		@pond.present?
	end
	
	def out_pond
    if @pond
      @pond.ducks.delete(self) if @pond.ducks.include? self
      @pond = nil
    else
      {:error => ""}
    end
	end
	
	def self.nb_duck_in_pond
		@@nb_duck
	end
end

class Ducking

	def quak
		'coin'
	end

end