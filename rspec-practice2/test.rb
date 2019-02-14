require 'byebug'

class Array

 
 
  def bubble_sort!(&prc)
    bool = true
    while bool
    bool = false
    (0..self.size-2).each do |i|
      if block_given?
        if prc.call(self[i], self[i+1]) == 1
          self[i], self[i+1] = self[i+1], self[i]
          bool = true
        end
      else # block not given
        if (self[i] > self[i+1])
          self[i], self[i+1] = self[i+1], self[i]
          bool = true
        end
      end  
    end
    end # end while
  return self
end # end bubble_sort!
  
  
 def bubble_sort(&prc)
   self.dup.bubble_sort!(&prc)
  end
end


ascending = Proc.new { |num1, num2| num1 <=> num2 } #sort ascending
descending = Proc.new { |num1, num2| num2 <=> num1 } #sort descending

print [1,5,4,6].bubble_sort! #=> [1,4,5,6]
puts
print [1,5,4,6].bubble_sort!(&ascending) #=> [6,5,4,1]
puts
print [1,2,3,4,5].shuffle.bubble_sort!(&descending) #=> [1,2,3,4,5]
puts
