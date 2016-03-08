class Coordinate
  attr_accessor :x, :y
  def initialize(x,y)
    @x = x
    @y = y
  end

  def eql?(other)
    other.x == x and other.y == y
  end
  
  def ==(other)
    other.x == x and other.y == y
  end
  
  def hash
    [x,y].hash
  end
end