require_relative 'coordinate'

class Santa
  attr_accessor :path

  def initialize
    @path = [Coordinate.new(0, 0)]
  end

  def last
    @path.last.clone
  end

  def north
    current = last
    current.x += 1
    @path.push current
  end

  def south
    current = last
    current.x -= 1
    @path.push current
  end

  def east
    current = last
    current.y += 1
    @path.push current
  end

  def west
    current = last
    current.y -= 1
    @path.push current
  end

  def move(dir)
    case dir
    when '^'
      north
    when 'v'
      south
    when '>'
      east
    when '<'
      west
    end
  end
end
