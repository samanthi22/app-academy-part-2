require_relative "room"

class Hotel
  def initialize(name, hash)
     @name = name
     @rooms = {}
     hash.each do |key, value|
         @rooms[key] = Room.new(value)
     end
  end
  
  def name
      name = @name.split(" ")
      name.each do |word|
          word = word.capitalize!
      end 
      @name = name.join(" ")
  end 
  
     def rooms
      @rooms
    end 
    
    def room_exists?(room)
        if @rooms.include?(room)
            return true
        else
            return false
        end
    end
    
    def check_in(person, room)
        if self.room_exists?(room)
            if @rooms[room].add_occupant(person)
            puts "check in successful"
            else
            puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
        
    end
    
    def has_vacancy?
        if @rooms.all? { |key, value| value.full? }
            return false
        else
            return true
        end
    end
    
    def list_rooms
       @rooms.each do |key, room|
          puts key + " *" + room.available_space.to_s
       end
    end
  
end
