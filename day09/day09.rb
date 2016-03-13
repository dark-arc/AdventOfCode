require_relative 'map'
require_relative 'mapCodeParser'
$input = File.open('day09.in').read

map = Map.new
scanner = MapCodeParser.new $input, map
scanner.run

distances = []

map.nodes.permutation.map do |route|
  prev = nil
  total = 0
  route.each do |node|
    total += map.get_distance(prev, node) unless prev.nil?
    prev = node
  end
  route = route.map(&:name).join('->')
  distances << [route, total]
end

# Part 1
puts distances.min { |a, b| a[1] <=> b[1] }.inspect
# Part 2
puts distances.max { |a, b| a[1] <=> b[1] }.inspect
