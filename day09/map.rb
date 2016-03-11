require_relative 'node'
require_relative 'path'

class Map
	attr_accessor :nodes, :paths
	
	def initialize
		@nodes = []
		@paths = []
	end
	
	def add_path(from,to,distance)
		from = node(from)
		to = node(to)
		path = Path.new(from,to,distance)
		@paths << path
	end
	
	def node(name)
		ret = @nodes.select{|n| n.name == name}.first
		return ret unless ret.nil?
		ret = Node.new(name)
		nodes << ret
		return ret unless ret.nil?
	end
	
	def get_distance(start,finish)
		path = Path.new(start,finish)
		path = @paths.select{|p| p.between == path.between}.first
		return path.distance
	end
end