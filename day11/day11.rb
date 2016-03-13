class String
  def validate_password
    bad_letters &&
      overlapping_pairs &&
      has_straight
  end

  def bad_letters
    !(self.include?('i') ||
         self.include?('o') ||
         self.include?('l'))
  end

  def overlapping_pairs
    pairs = scan(/(\w)\1/)
    pairs.uniq
    (pairs.uniq.count >= 2)
  end

  def has_straight
    split('').each_with_index do |k, v|
      if self[v + 1] == k.next &&
         self[v + 2] == k.next.next
        return true
      end
    end
    false
  end
end

password = 'cqjxjnds'

password.next! until password.validate_password

puts password
password.next!

password.next! until password.validate_password

puts password
