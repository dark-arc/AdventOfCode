$input = "1113222113"
class String
	def looksay
		self.gsub(/(.)\1*/) do 
			"#{$&.size}#{$1}"
		end
	end
end

temp = $input
40.times {temp = temp.looksay}
puts temp.length
10.times {temp = temp.looksay}
puts temp.length