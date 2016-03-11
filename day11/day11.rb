class String 
	def validate_password
		bad_letters and
		overlapping_pairs and
		has_straight
	end
	
	def bad_letters
		return !(self.include? 'i' or 
				 self.include? 'o' or 
				 self.include? 'l')
	end
	
	def overlapping_pairs
		pairs = self.scan(/(\w)\1/)
		pairs.uniq
		return (pairs.uniq.count >= 2)
	end
	
	def has_straight
		self.split('').each_with_index do |k,v|
			if (self[v + 1] == k.next and 
			    self[v + 2] == k.next.next)
				return true
			end
		end
		return false
	end
end

password ='cqjxjnds'

until password.validate_password
	password.next!
end

puts password
password.next!

until password.validate_password
	password.next!
end

puts password