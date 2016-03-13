require 'digest'
# Input
$input = 'iwrupvqb'
# Pre-code
def get_digest(regex)
  index = 0
  while
    digest = Digest::MD5.hexdigest("#{$input}#{index}")
    puts '%7i: %s' % [index, digest]
    index += 1
    return [index, digest] if digest =~ regex
  end
end
# Part 1.
p1 = get_digest(/^00000/)
# Part 2.
p2 = get_digest(/^000000/)

puts 'Part 1: %i' % p1[1]
puts 'Part 2: %i' % p2[1]
