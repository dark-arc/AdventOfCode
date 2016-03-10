require 'strscan'
require 'yaml'
# Input
$input = File.open('day08.in').read

class StringParser
  attr_reader :strings
  def initialize(input)
	@buffer = StringScanner.new input
	@strings = []
  end 
  
  def run
	until @buffer.eos? do 
		skip_whitespace
		@strings << parse_string
	end
  end

  def skip_whitespace
    @buffer.skip(/\s/)
  end
  
  def parse_string
	@buffer.skip_until /"/ # "
	token = ""
	
	while chr = @buffer.getch
		case chr
		when /"/ #"
			break;
		when /\\/
			token << parse_escape
		else
			token << chr
		end
	end 
	return token
  end
  
  def parse_escape
	ret = ''
	case @buffer.peek(1)
	when '"'
		ret = '"'
		@buffer.getch
	when '\\'
		ret = '\\'
		@buffer.getch
	when 'x'
		@buffer.getch
		code = @buffer.scan /\h{2}/
		ret= [code].pack('H*')
	else 
		raise ParserError 'Bad escape sequence. '
	end
	return ret
  end
end

class ParserError < StandardError
end
# Part 1.
scanner = StringParser.new $input
scanner.run

code = $input.lines.reduce(0){|sum,cur| sum+=cur.strip.length}
memory = scanner.strings.reduce(0) {|sum,cur| sum+=cur.length}
escaped = $input.lines.reduce(0) {|sum,cur| sum+=cur.chomp.inspect.length}

puts code - memory
# Part 2
puts escaped - code
