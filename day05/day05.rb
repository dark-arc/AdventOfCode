require 'digest'
require_relative 'nice_string'
# Input
$input = File.open('day05.in').read
 
# Part 1.
nice = 0
$input.each_line do |x|
  nice += 1 if x.nice
  #puts "%10s %s" % [x.nice, x]
end
puts nice
# Part 2.
nice = 0
$input.each_line do |x|
  nice += 1 if x.nice2
  #puts "%10s %s" % [x.nice2, x]
end
puts nice

