$input = File.open('day12.in').read

puts $input.scan(/(-*\d*)/).reduce(0){|sum,cur| sum += cur.first.to_i}