require 'byebug'

def can_tweak_sign?(normal_sign, vandalized_sign)
    normal_sign = normal_sign.downcase.gsub(/[^[:word:]\s]/, "").gsub(/\s+/, "")
    vandalized_sign = vandalized_sign.downcase.gsub(/[^[:word:]\s]/, "").gsub(/\s+/, "")
    length = vandalized_sign.length
    if anagram(normal_sign, vandalized_sign)
        return true
    else
        return false
    end
end

def character_count(str)
end

def anagram(word1, word2) 
   hash1 = Hash.new(0)
   word1 = word1.chars
   word1.each do |ch|
       hash1[ch] += 1
   end
   hash2 = Hash.new(0)
   word2 = word2.chars
   word2.each do |ch|
       hash2[ch] += 1
   end
   #byebug
   hash2.each do |key, value|
      if value > hash1[key]
          return false
      end
   end
   return true
end


puts can_tweak_sign?("We're having a yellow ferret sale for a good cause over at the pet shop!", "Leopard ferrets forever yo") # => true
puts can_tweak_sign?("abcd", "aa") #=> false
puts can_tweak_sign?("aaaforeveryoaa", "foreveryo") #=> true
puts anagram("cinema", "iceman") #=> true
#puts character_count(str)
puts anagram("eopardferretsforeveryol", "leopardferretsforeveryo") #=> true
puts can_tweak_sign?("foreveryoaa", "foreveryo") # => true