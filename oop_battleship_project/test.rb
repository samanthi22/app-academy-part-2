class Board
  attr_reader :size
    
  def initialize(number)
      @grid = Array.new(number, :N) { Array.new(number, :N) }
      @size = number * number
  end 
  
  def [](position)
      row, col = position
      @grid[row][col]
  end
  
  def []=(position, value)
      row, col = position
      @grid[row][col] = value
  end
  
  def num_ships
       count = 0
      @grid.each do |row_column|
          row_column.each do |value|
             if value == :S
                 count += 1
             end
          end
      end
      return count
  end
  
  def attack(position)
      if self[position] == :S
          self[position] = :H
          puts "you sunk my battleship"
          return true
     else
         self[position] = :X
         return false
    end 
  end
  
  def place_random_ships
     amount = @size * 0.25
     while self.num_ships < amount
        rand_row = rand(0...@grid.length)
        rand_col = rand(0...@grid.length)
        position = [rand_row, rand_col]
        self[position] = :S
     end
     return @grid
  end
  
  def hidden_ships_grid
      array = []
      @grid.each do |position|
         arr = []
         position.each do |value|
            if value == :S
                arr << :N
            else
                arr << value
            end
         end
         array << arr
      end
      return array
  end
  
  def self.print_grid(grid)
      grid.each do |row|
         row.each do |value|
            print "#{value} " 
         end
         puts
      end
  end
end

board = Board.new(2)

real_grid = [
          [:S, :N],
          [:X, :S]
        ]

hidden_grid = [
          [:N, :N],
          [:X, :N]
        ]

#p board.num_ships
#p board.num_ships
#p board.attack(pos) #=> :H
# p board.place_random_ships
puts
#p board.hidden_ships_grid
puts
p Board::print_grid([
          [:S, :N],
          [:X, :S]
        ])