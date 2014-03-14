#implement an algorithm to determin if a string has all unique characters, what if you cannot use additional data structures?


def solution1(word)
  @n = 0
  start_index = 0
  end_index = word.length - 1
  hash = {}

  while(start_index <= end_index)
    @n += 1

    if !hash[word[start_index]]
      hash[word[start_index]] = true
    else
      return [true, @n]
    end
    start_index +=1
  end

  return [false, @n]
end

def solution2(word)
  @n = 0
  start_index = 0
  end_index = word.length - 1

  while(start_index <= end_index)
    @n += 1

    word[start_index...end_index].each do |letter|
      @n += 1
      if letter == word[start_index]
        return [true, @n]
      end
    end

    start_index +=1
  end

  return [false, @n]
end


puts "solution1 is #{solution1("abc")}"
puts "solution1 is #{solution1("dazqfadsffadfafaac")}"

puts "solution2 is #{solution1("abc")}"
puts "solution2 is #{solution1("dazqfadsffadfafaac")}"
