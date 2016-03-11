require 'json'
$input = File.open('day12.in').read

puts $input.scan(/(-*\d*)/).reduce(0){|sum,cur| sum += cur.first.to_i}

hash = JSON.parse($input)

def find_numbers(input)
	case input
	when Array
		input.flat_map {|value| find_numbers(value)}.compact
	when Hash
		find_numbers(input.values).compact unless 
			input.values.include? 'red'
	when Fixnum
		[input]
	end
end

puts find_numbers(hash).inject(:+)