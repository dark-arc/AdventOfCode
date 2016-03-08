require_relative 'box'
# Input
$input = File.open('day02.in').read

@boxes = []
$input.each_line do |dimen|
	@boxes.push(Box.new(dimen.split('x')))
end
# Part 1. 
puts @boxes.reduce(0) {|sum, cur| sum+=cur.paper_required}
# Part 2. 
puts @boxes.reduce(0) {|sum, cur| sum+=cur.bow}
