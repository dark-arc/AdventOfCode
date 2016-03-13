require_relative 'matrix.rb'
# Input
$input = File.open('day06.in').read
RGX_INST =
  /(?<instruction>.*) (?<x1>\d+),(?<y1>\d+) through (?<x2>\d+),(?<y2>\d+)/
# Pre-code

# Part 1.
board = Matrix.new

$input.each_line do |instruction|
  parsed = instruction.match(RGX_INST)
  coords = [
    parsed[:x1].to_i,
    parsed[:x2].to_i,
    parsed[:y1].to_i,
    parsed[:y2].to_i
  ]
  case parsed[:instruction]
  when 'turn off'
    board.off(coords)
  when 'turn on'
    board.on(coords)
  when 'toggle'
    board.flip(coords)
  end
end

puts board.count
board.display
board.save('part1')
# Part 2.
board = Matrix.new

$input.each_line do |instruction|
  parsed = instruction.match(RGX_INST)
  coords = [
    parsed[:x1].to_i,
    parsed[:x2].to_i,
    parsed[:y1].to_i,
    parsed[:y2].to_i
  ]
  case parsed[:instruction]
  when 'turn off'
    board.dec(coords)
  when 'turn on'
    board.inc(coords)
  when 'toggle'
    board.inc(coords, 2)
  end
end

puts board.count
board.display
board.save('part2')
