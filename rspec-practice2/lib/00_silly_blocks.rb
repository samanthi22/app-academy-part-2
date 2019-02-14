def reverser(&block)
    arr = []
    words = yield.split
    words.each do |word|
        arr.push(word.reverse)
    end
    arr.join(" ")
end

def adder(num = 1, &block)
    block.call + num
end

def repeater(num = 1, &block)
    (1..num).each { block.call }
end
