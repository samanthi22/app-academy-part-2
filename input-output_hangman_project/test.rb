require 'byebug'

class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def initialize()
     #@secret_word = Hangman::random_word 
     @secret_word = "bootcamp"
     @guess_word = Array.new(@secret_word.length, "_") 
     @attempted_chars = []
     @remaining_incorrect_guesses = 5
  end
  
  def guess_word
     @guess_word 
  end
  
  def attempted_chars
      @attempted_chars
  end

    def self.random_word
        @@random_word = DICTIONARY.sample
    end 
    
    def remaining_incorrect_guesses
        @remaining_incorrect_guesses
    end
    
    def already_attempted?(char)
         @attempted_chars.include?(char)
    end 
    
    def get_matching_indices(char)
        arr = []
        word = @secret_word.chars
        word.each_with_index do |ch, i|
           if ch == char
               arr << i
           end 
        end
        return arr
    end
    
    def fill_indices(char, arr) 
        arr.each do |i|
           @guess_word[i] = char
        end
        @guess_word
    end
    
    def try_guess(char)
        if self.get_matching_indices(char).length > 0
            @remaining_incorrect_guesses
        else
            @remaining_incorrect_guesses -= 1
        end
        arr = self.get_matching_indices(char)
        self.fill_indices(char, arr)
        if self.already_attempted?(char)
           puts "that has already been attempted"
           return false
        else
            @attempted_chars << char
            return true
        end
       
    end
        
end

hangman1 = Hangman.new
hangman2 = Hangman.new
print hangman1.try_guess("o") #=> expect(hangman.remaining_incorrect_guesses).to eq(5) [1,2] indices
puts
print hangman2.try_guess("x") #=> expect(hangman.remaining_incorrect_guesses).to eq(4)
puts
puts hangman1.remaining_incorrect_guesses #=> 5
puts hangman2.remaining_incorrect_guesses #=> 4