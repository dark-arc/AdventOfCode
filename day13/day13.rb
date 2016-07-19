require 'yaml'
$input = File.open('day13.in').read
HAPPINESS_LINE = /^(?<name>[A-Z][a-z]*).*(?<op>lose|gain)\s*(?<amount>\d+).*(?<to>[A-Z][a-z]*)./

$people = Array.new
class Person
	attr_reader :name, :ref
	
	def self.add(args = {})
		person = $people.select {|p| p.name == args[:name]}
		if person.empty?
			$people.push(person =Person.new(args))
		else 
			person.first.add_op(args)
		end
		return person
	end
	
	def self.sum(list)
		sum = 0
		list.each_with_index do |c,i|
			p,n = list[((i-1) % list.size)],list[((i+1) % list.size)]
			r = c.ref.select{|r| 
				r[:next_to] == p.name or r[:next_to] == n.name} 
			sum += r.inject(0){|s,r| s + (r[:amount])} 
		end
		return sum
	end
	
	def initialize(args = {})
		@name = args[:name]
		@ref = []
		add_op(args) unless args[:to].nil?
	end
	
	def add_op(args={})
		return nil if args[:to] == name
		@ref << {next_to: args[:to],
		amount: case args[:op]
				when "lose"; -args[:amount].to_i
				when "gain";  args[:amount].to_i
				end}
	end
end

$input.each_line {|l| Person.add(l.match(HAPPINESS_LINE))}
# Part 1
happiness = []
$people.permutation.to_a.each do |list|
	happiness << {sum: Person.sum(list), seats: list}
end
puts p1=happiness.max{|a,b| a[:sum] <=> b[:sum]}
# Part 2
Person.add(name:"Matthew")
happiness = []
$people.permutation.to_a.each do |list|
	happiness << {sum: Person.sum(list), seats: list}
end
puts p2=happiness.max{|a,b| a[:sum] <=> b[:sum]}