require 'byebug'

=begin 
In this challenge, you will be given an array of integers and a target value. Determine the number of distinct pairs of elements in the array that sum up to the target value. Two pairs (a,b) and (c,d) are considered to be distinct if and only if the values in sorted order do not match, i.e., (1,9) and (9,1) are indistinct but (1,9) and (9,2) are distinct.

For example given the array [1,2,3,6,7,8,9,1] and the target value of 10, the seven pairs (1,9), (2,8), (8,2), (9,1) and (1,9) all sum to 10 and theere are only three distinct pairs (1,9) , (2, 8) and (3,7)
=end

def numberOfPairs(a,k)
   count = 0
   find_arr(a,k).each do |pair|
      if uniq(pair,k)
          count += 1
      end
   end
   return count
end 

def length(a,k)
    return find_arr(a,k).length
end 


def pair_reverse(pair)
    pair[0], pair[1] = pair[1], pair[0]
    return pair
end 

def find_arr(a,k)
   length = a.length
   new_arr = []
   count = 0
   i = 0
   #byebug
   while i < length
     j = 0
     while j < length
        if j > i
           arr = []
           if (uniq([a[i], a[j]], k) && remove_dups(new_arr, [a[i], a[j]]))
           arr << a[i]
           arr << a[j]
           new_arr << arr
           end
        end
     j += 1
 end
   i += 1
   end
   return new_arr
end

def remove_dups(new_arr, pair)
    if !new_arr.include?(pair_reverse(pair))
        return true
    else
        return false
    end
end

def uniq(pair, k)
    sum = 0
    pair.each do |number|
        sum += number 
    end
    if sum == k
        return true
    else
        return false
    end
end


print numberOfPairs([7,6,12,3,9,3,5,1,12], 12) #=> 2
puts
print numberOfPairs([1,3,46,1,3,9],47) #=> 1
puts
print find_arr([1,3,46,1,3,9],47) #=> [[1,46]]
puts
print numberOfPairs([6,1,3,46,1,3,9,47],47) #=> 1
puts
print numberOfPairs([7,6,12,3,9,3,5,1], 12) #=> 2
puts
print find_arr([7,6,12,3,9,3,5,1], 12) #=> [[7,5], [3,9]]
puts
print remove_dups([[7,5], [3,9], [9,3]], [7,5]) # => true
puts 
puts
print pair_reverse([3,9]) # => [9,3]
puts

