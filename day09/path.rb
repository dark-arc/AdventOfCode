class Path
	attr_reader :distance, :between
	
	def initialize(from,to,distance=nil)
		@between = [from,to].sort{|a,b| a.name <=> b.name}
		@distance = distance
	end
end