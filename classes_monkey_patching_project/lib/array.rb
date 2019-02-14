require 'byebug'

# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
     if self.length == 0
         return nil
     else
        return self.max - self.min 
     end
  end 
  
  def average
     if !self.empty?
     sum = 0.0
     self.each do |num|
         sum += num
     end
     return sum / self.length
     else
         return nil
     end
  end
  
  def median
    self.sort!
    if self.length.odd?
        return self[self.length / 2.0]
    elsif self.empty?
        return nil
    else
        ele1 = self[self.length / 2.0 - 1]
        ele2 = self[self.length / 2.0]
        arr = [ele1, ele2]
        return arr.average
    end
  end
  
  def counts
     hash = Hash.new(0)
     self.each do |num|
        hash[num] += 1 
     end
     return hash
  end 
  
  def my_count(char)
     count = 0
     hash = Hash.new(0)
     self.each do |num|
        hash[num] += 1 
     end
     return hash[char]
  end
  
  def my_index(char)
      self.each_with_index do |ch, i|
          if ch == char
              return i
          end
       end
       return nil
  end
  
  def my_uniq
      hash = {}
      self.each do |ele|
         hash[ele] = true 
      end
      return hash.keys.to_a
  end 
  
   def my_transpose
        two_d = []
     self.length.times do |i|
        pair_arr = []
        self.each do |pair|
            pair_arr << pair[i] # pair[0]
        end
        two_d << pair_arr
     end
     return two_d
 end
end
