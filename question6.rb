#remove the duplicate items in array without an additional buffer

def solution1(words)
  @n = 0
  start_index = 0
  end_index = words.length - 1

  words.each_with_index do |letter, index|
    @n += 1

    words.each_with_index do |current_letter, current_index|
      @n += 1
      if current_letter == letter and index != current_index
        words[current_index] = nil
      end
    end
  end

  return [words, @n]
end

def solution2(words)
  @n = 0
  start_index = 0
  end_index = words.length - 1

  words.each_with_index do |letter, index|
    @n += 1

    words[index+1...end_index].each_with_index do |current_letter, current_index|
      @n += 1
      if current_letter == letter
        words[current_index+index+1] = nil
      end
    end
  end

  return [words, @n]
end

def solution3(words)
  @n = 0
  start_index = 0
  end_index = words.length - 1

  words.each_with_index do |letter, index|
    #0, 1, 2, 3
    @n += 1

    if index+1 <= end_index
      words[index+1...end_index].each_with_index do |current_letter, current_index|
        @n += 1
        if current_letter == letter
          words[current_index+index+1] = nil
        end
      end
    end
  end

  return [words, @n]
end


puts "solution1 is #{solution1([1,2,3,4,5])}"
puts "solution1 is #{solution1([1,2,5,1,2,2,3,3,4,4,5,6])}"

puts "solution2 is #{solution2([1,2,3,4,5])}"
puts "solution2 is #{solution2([1,2,5,1,2,2,3,3,4,4,5,6])}"

puts "solution3 is #{solution3([1,2,3,4,5])}"
puts "solution3 is #{solution3([1,2,5,1,2,2,3,3,4,4,5,6])}"
