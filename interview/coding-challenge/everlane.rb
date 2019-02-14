def format_names(*names)
    
end

puts format_names("Bender") # => "Bender"
puts format_names("Bender, Fry") #=> "Bender and Fry"
puts format_names("Bender, Fry, Leela") #=> "Bender, Fry, and Leela"
puts format_names("Bender, Fry, Professor Eden, Leela") # => "Bender, Fry, Professor Farnsworth, and Leela"
puts format_names("Bender, Fry, Professor Farnsworth, Leela", { "length": 1 }) #=> "Bender, and 3 more"
puts format_names("Bender, Fry, Professor Farnsworth, Leela", { "length": 8 }) #=> "Bender, Fry, Professor Farnsworth, and Leela" 
# In this case, the 'length' property is larger than the amount of names passed in, so the expected output is not rolled up
puts format_names("Bender, Fry, Professor Farnsworth, and Leela", {"length": 0}) #=> ""
puts format_names("Bender, Fry, Professor Farnsworth, and Leela", {"length": 3, "sorted": true}) #=> Bender, Fry, Leela, and 1 more
