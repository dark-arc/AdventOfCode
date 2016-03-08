# Input
$input = File.open('day01.in').read

# Part 1. 
ups = $input.count '('
downs = $input.count ')'

puts ups - downs 
# Part 2. 
floor = 0
step = -1
catch(:found) do
  $input.split('').each_with_index do |c,i|
    case c
    when '('
      floor += 1
    when ')'
      floor -= 1
    end
    if floor == -1 
      puts step = (i+1)
      throw :found
    end 
  end
end
