class String
  def nice
    return false unless squeeze.size < size
    %w(ab cd pq xy).each do |inc|
      return false if self.include?(inc)
    end
    return false if count('aeiou') < 3
    true
  end

  def nice2
    return false unless self =~ /(..).*\1/
    return false unless self =~ /(.).\1/
    true
  end
end
