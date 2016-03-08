class Box
	attr_accessor :d
	def initialize(dimen)
		@d = {l: dimen[0].to_i, w: dimen[1].to_i, h: dimen[2].to_i}
	end
	
	def rectangular_area
		return 	@rectangle_area ||= 
				@rectangle_area = 
				length*width,
				width*height,
				height*length,
				length*width,
				width*height,
				height*length
	end
	
	def surface
		return 	rectangular_area.reduce(0){|sum, cur| sum+=cur}
	end
	
	def extra
		return rectangular_area.sort.first
	end
	
	def circumferences
		return 	2*length+2*width,
				2*height+2*width,
				2*length+2*height
	end
	
	def paper_required
		return surface+extra
	end
	
	def volume
		return length*width*height
	end
	
	def bow
		return volume + circumferences.sort.first
	end
	
	def height() return @d[:h] end
	def width()	return @d[:w] end
	def length() return @d[:l] end
end