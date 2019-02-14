# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
    str = str.gsub(/[^[:word:]\s]/, "")
    hash = {}
    str = str.split(" ")
    str.each do |word|
       hash[word] = word.length 
    end
    return hash
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
     sorted = hash.sort_by{ |key, value| value}
    return sorted.to_h.keys.last
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
    older.each do |key, value|
       older[key] = value  
    end
    newer.each do |key, value|
        older[key] = value
    end
    return older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
    hash = Hash.new(0)
    letters = word.chars
    letters.each do |ch, value|
        hash[ch] += 1
    end
    return hash
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
     hash = {}
    arr.each do |num|
       hash[num] = ""
    end
    return hash.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
    hash = Hash.new(0)
    numbers.each do |num|
       if num %2 ==0
        hash[:even] += 1
       else
          hash[:odd] +=1
       end
    end
    return hash
end

# Define a method that, given a string, returns the most common vowel. Do
# not worry about ordering in the case of a tie. Assume all letters are 
# lower case.
def most_common_vowel(string)
   hash = Hash.new(0)
    vowels = "aeiou"
    letters = string.chars
    letters.each do |ch|
        if vowels.include?(ch)
            hash[ch] += 1
        end 
    end
    
    sorted = hash.sort_by {|key, value| value}
    return sorted.to_h.keys.last
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
    hash = {}
    arr = []
    students.each do |key, value|
       if value >= 7
           hash[key] = value
       end
    end
    hash.each do |key, value|
       arr << key 
    end
    combination(arr)
end

def combination(arr)
   new_array = []
   i = 0
   while i < arr.length
      arr[i]
      j = 0 
      while j < arr.length
         if j > i
             new_arr = []
             new_arr << arr[i]
             new_arr << arr[j]
             new_array << new_arr
         end
      j += 1
      end
   i += 1
   end
   return new_array
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
    int = 0
    hash = Hash.new(0)
    specimens.each do |value|
        hash[value] += 1
    end
    return hash.keys.size**2
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
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