require 'byebug'

class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def initialize()
     @secret_word = Hangman::random_word 
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
    
    def ask_user_for_guess
        puts "Enter a char:"
        input = gets.chomp
        return self.try_guess(input)
    end
    
    def win?
       if @guess_word.join("") == @secret_word
           puts "WIN"
           return true
       else
           return false
       end
    end
    
    def lose?
        if @remaining_incorrect_guesses == 0
            puts "LOSE"
            return true
        else
            return false
        end
    end
    
    def game_over?
        if self.win? || self.lose?
            puts @secret_word
            return true
        else 
            return false
        end
    end
        
        
end
