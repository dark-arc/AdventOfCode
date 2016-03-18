require 'yaml'
$input = File.open('day14.in').read
REINDEER_LINE = /(?<who>[A-Z][a-z]*)[^\d]*(?<speed>\d*)[^\d]*(?<for>\d*)[^\d]*(?<rest>\d*)/

class Reindeer
    attr_reader :location
	def initialize(args = {})
		@who, @speed, @for, @rest ,@state, @location, @ticks= 
			*[args[:who],args[:speed].to_i,args[:for].to_i, args[:rest].to_i, :flying, 0,0]
		@counter = @for
	end
	
	def tick
		@ticks+=1
		@counter-=1
		@location += @speed if flying?

		toggle_state unless @counter > 0 
	end
    
    def flying?
        @state == :flying
    end
	
	def toggle_state
		if @state == :resting
            @state = :flying
			@counter = @for
		else
			@state = :resting
			@counter = @rest
		end	
	end
end	

reindeer = []
$input.each_line {|l| reindeer << Reindeer.new(l.match(REINDEER_LINE))}

2503.times {reindeer.each{|x| x.tick}}
puts reindeer.max{|a,b| a.location <=> b.location}.inspect