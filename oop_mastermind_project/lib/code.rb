class Code
  attr_accessor :pegs
  
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  
  def self.valid_pegs?(chars)
    chars.all? { |ch| POSSIBLE_PEGS.has_key?(ch.upcase) }
  end

  def initialize(pegs)
    if Code::valid_pegs?(pegs)
      arr = []
      pegs.each do |ch| 
          arr << ch.upcase
      end
      @pegs = arr
    else
      raise "error"
    end 
  end
  
  def self.random(length)
    arr = []
    length.times do |i|
      arr << POSSIBLE_PEGS.keys.to_a.sample
    end
    return Code.new(arr)
  end
  
  def self.from_string(string)
    arr = []
    chars = string.split("")
    chars.each do |ch|
      arr << ch 
    end
    return Code.new(arr)
  end
  
  def [](index)
    return @pegs[index]
  end
  
  def length
    @pegs.length
  end
  
  # part 2
  
  def num_exact_matches(guess)
    count = 0
    self.length.times do |i|
     if guess[i] == @pegs[i]
       count += 1
     end
    end
    return count
  end
  
  def num_near_matches(guess)
     count = 0
    self.length.times do |i|
      if guess[i] == @pegs[i]
      else
        # same color but not position
        if @pegs.include?(guess[i])
          count += 1
        end
      end
    end
    return count
  end 
  
  def ==(arg)
    if arg.length == self.length
      self.length.times do |i|
        if self[i] != arg[i]
          return false
        end 
      end
      return true
    else
      return false
    end
  end

end
