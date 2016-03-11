require 'strscan'
require_relative 'map'

class MapCodeParser
	attr_reader :map
	
	def initialize(code,map)
		@map = map
		@buffer = StringScanner.new code
	end
	
	def run
		until @buffer.eos? do 
			skip_whitespace
			parse_line
			@buffer.skip_until /$/
		end
	end
	
	def parse_line
		@buffer.scan /(?<from>\w*)\W*to\W*(?<to>\w*)\W*=\W*(?<distance>\d*)/
		
		@map.add_path(
				@buffer[:from],
				@buffer[:to],
				@buffer[:distance].to_i) unless
				@buffer[:from].nil? or @buffer[:to].nil? or @buffer[:distance].nil?
	end
	
	def skip_whitespace
		@buffer.skip(/\s/)
	end
end