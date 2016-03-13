require_relative 'santa'
# Input
input = File.open('day03.in').read
# Part 1.
@santa = Santa.new

input.split('').each do |inst|
  @santa.move(inst)
end
visits = Hash.new(0)
@santa.path.each do |coord|
  visits[coord] += 1
end
puts visits.reduce(0) { |ttl, val| ttl += 1 if val.last > 0 }

# Part 2.
@santa = Santa.new
@robo = Santa.new
@turn = 0

input.split('').each do |inst|
  if @turn.odd?
    @robo.move(inst)
  elsif @turn.even?
    @santa.move(inst)
  end
  @turn += 1
end
visits = Hash.new(0)
@santa.path.each do |coord|
  visits[coord] += 1
end
@robo.path.each do |coord|
  visits[coord] += 1
end
puts visits.reduce(0) { |ttl, val| ttl += 1 if val.last > 0 }
