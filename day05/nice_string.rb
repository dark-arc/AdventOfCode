class String
  def nice
    return false unless self.squeeze.size < self.size
    ['ab','cd','pq','xy'].each do |inc|
      return false if self.include?(inc)
    end
    return false if self.count('aeiou') < 3
    return true
  end

  def nice2
    return false unless self =~ /(..).*\1/
    return false unless self =~ /(.).\1/
    return true
  end
end