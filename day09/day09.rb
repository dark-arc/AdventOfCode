require 'yaml'

class Path
	attr_reader :distance, :between
	
	def initialize(from,to,distance=nil)
		@between = [from,to].sort{|a,b| a.name <=> b.name}
		@distance = distance
	end
end

class Node
	attr_reader :name
	
	def initialize(name)
		@name = name
	end
end

class Map
	attr_accessor :nodes, :paths
	
	def initialize
		@nodes = []
		@paths = []
	end
	
	def add_path(from,to,distance)
		from = node(from)
		from.class
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

map = Map.new

map.add_path('London', 'Dublin', 464)
map.add_path('London', 'Belfast', 518)
map.add_path('Dublin', 'Belfast', 141)

map.nodes.permutation.map do |route|
	puts route.map{|node| node.name}.join('->')
	prev = nil
	total = 0
	route.each do |node|
		total += map.get_distance(prev,node) unless prev.nil?
		prev = node
	end
	puts total
	puts
end