require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player
    
    def initialize(n)
       @player = Player.new
       Board::new(n)
       @board = Board.new(n*n)
       @remaining_misses = (n*n) / 2.0
    end
    
    def start_game
        @board.place_random_ships
        print @board.num_ships
        print @board.print
    end
    
    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        else
            return false
        end
    end
    
    def win?
        @board.num_ships
        if @board.num_ships == 0
            puts "you win"
            return true
        else 
            return false
        end
    end
    
    def game_over?
        if win? || lose? 
            return true
        else
            return false
        end
    end
    
    def turn
       input = @player.get_move 
       if @board.attack(input)
       @board.print
       print @remaining_misses
       else
       @board.print
       @remaining_misses -= 1
       print @remaining_misses
       end
    end
        
    
    
end
