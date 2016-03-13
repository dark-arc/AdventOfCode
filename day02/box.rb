class Box
  attr_accessor :d
  def initialize(dimen)
    @d = { l: dimen[0].to_i, w: dimen[1].to_i, h: dimen[2].to_i }
  end

  def rectangular_area
    [@rectangle_area ||=
        @rectangle_area =
        length * width,
     width * height,
     height * length,
     length * width,
     width * height,
     height * length]
  end

  def surface
    rectangular_area.reduce(0) { |sum, cur| sum += cur }
  end

  def extra
    rectangular_area.sort.first
  end

  def circumferences
    [2 * length + 2 * width,
     2 * height + 2 * width,
     2 * length + 2 * height]
  end

  def paper_required
    surface + extra
  end

  def volume
    length * width * height
  end

  def bow
    volume + circumferences.sort.first
  end

  def height
    @d[:h]
 end

  def width
    @d[:w]
 end

  def length
    @d[:l]
 end
end
