require 'strscan'
# Input
$input = File.open('day07.in').read

# Pre-code
class LogicGateParser
  attr_accessor :registers, :opcodes, :stuck
  STRICT = false
  REG_NUMERIC = /\d+/
  REG_REGISTER = /[a-z]+/
  REG_COMMAND = /[A-Z]+/
  REG_INPUT = /[a-z0-9]+\s->/

  def initialize(prog)
    @prog = prog
    @registers = Hash.new()
	@stuck = Array.new()
	@opcodes = Array.new()
  end

  def run
    parse
    @registers.sort_by{|k,v| k}
  end

  def parse
    @buffer = StringScanner.new @prog
    until @buffer.eos?
      skip_whitespace
      if @buffer.match? /.*->.*$/
        position = @buffer.pos
        skip = true
        catch :do_later do 
          result = get_result          
          @buffer.skip_until(/->/)
          set_register(result)
          skip = false
        end
        if skip
          @buffer.pos = position
          line = @buffer.scan_until(/$/)
          @buffer.concat "\n#{line}"
        end
      end
      @buffer.skip_until(/$/)
    end
    @buffer.terminate
  end

  def get_operation
    return get_value, get_command, get_value
  end
  
  def get_result
    left,cmd,right = get_operation

    if ['AND', 'OR', 'LSHIFT', 'RSHIFT'].include?(cmd)      
      if left.nil? or right.nil?
        raise StandardError.new('Error while parsing') if STRICT
        throw :do_later
      end
    end
        
    result = case cmd
             when 'AND'
                 left & right
             when 'OR'
                 left | right
             when 'LSHIFT'
                 left << right
             when 'RSHIFT'
                 left >> right
             when 'NOT'
               throw :do_later if right.nil?
                 (~right)
             when 'MOV'
               throw :do_later if left.nil?
                 left
             end
    
    result = result % 65536
    @opcodes << [cmd,left,right,result]
    return result 
  end

  def get_value
    skip_whitespace
    if @buffer.match?(REG_REGISTER)
      get_register_value
    elsif @buffer.match?(REG_NUMERIC)
      get_numeric
    end
  end
  
  def get_numeric
    skip_whitespace
    @buffer.scan(REG_NUMERIC).to_i
  end

  def set_register(result)
    register = get_register
    @registers[register] = result unless
	   @stuck.include? register
  end

  def get_register_value
    @registers[get_register]
  end
  
  def get_register
    skip_whitespace
    @buffer.scan(REG_REGISTER)
  end

  def get_command
    skip_whitespace
    @buffer.scan(REG_COMMAND) || 'MOV'
  end

  def skip_whitespace
    @buffer.skip(/\s/)
  end
end
# Part 1.
p = LogicGateParser.new($input)
p.run
puts part1 = p.registers['a']
# Part 2.
p.registers.clear
p.registers['b'] = part1
p.stuck << 'b'
p.run
puts part2 = p.registers['a']


