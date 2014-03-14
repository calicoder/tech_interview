# You have a sorted integer array and a input number.
# Write a function that can calculate the frequency of the input number.

@array = [1, 2, 4, 7, 7, 7, 7, 7, 9, 10, 11, 12, 14, 23, 23, 23, 24, 52, 52, 52, 52,52,52,52,52,52,52,52,52,52,65,65,65,65,65,76,76,76,76,3453,23423]

#half = @array.count/2.ceil
puts "n is #{@array.count}"
#puts half

def solution1(search_num)
  @n = 0
  frequency = 0

  @array.each do |num|
    @n += 1
    if num == search_num
      frequency += 1
    end
  end

  puts "solution1 n is #{@n}"
  frequency
end

def solution2(search_num)
  @n = 0
  frequency = 0
  found = false

  @array.each do |num|
    @n += 1
    if num == search_num
      frequency += 1
      found = true
    elsif found
      break
    end
  end

  puts "solution2 n is #{@n}"
  frequency
end

def solution3(search_num)
  @n = 0
  frequency = 0
  index_of_one_num = solution3_bsearch(search_num, 0, @array.count-1)

  #walk forward
  i = index_of_one_num

  keep_going = true
  while (keep_going)
    if @array[i] == search_num
      frequency += 1
    else
      keep_going = false
    end
    @n += 1
    i +=1
  end

  #walk backwards
  i = index_of_one_num - 1
  keep_going = true
  while (keep_going)
    if @array[i] == search_num
      frequency += 1
    else
      keep_going = false
    end
    @n += 1
    i -= 1
  end


  puts "solution3 n is #{@n}"
  frequency
end

def solution3_bsearch(search_num, start_index, end_index)
  @n += 1
  middle_index = end_index/2.ceil

  #puts "search_num = #{search_num}, start_index = #{start_index}, end_index = #{end_index}"

  if @array[middle_index] == search_num
    middle_index
  elsif @array[middle_index] < search_num
    solution3_bsearch(search_num, middle_index, end_index)
  else
    solution3_bsearch(search_num, start_index, middle_index)
  end
end

puts "solution1 is #{solution1(52)}"
puts "solution2 is #{solution2(52)}"
puts "solution3 is #{solution3(52)}"

