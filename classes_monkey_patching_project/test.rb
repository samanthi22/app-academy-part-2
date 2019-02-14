class Array
    
    def my_transpose
        two_d = []
     self.length.times do |i|
        pair_arr = []
        self.each do |pair|
            pair_arr << pair[i] # pair[0]
        end
        two_d << pair_arr
     end
     return two_d
 end
     
end 

arr_1 = [
          ["a", "b", "c"],
          ["d", "e", "f"],
          ["g", "h", "i"]
        ]
p arr_1.my_transpose # =>expected_1 = [
          #["a", "d", "g"],
          #["b", "e", "h"],
          #["c", "f", "i"]
        #]