#reverse a string list with O(1) space complexity

def set_array
  @array = [1, 2, 4, 7, 7, 7, 7, 7, 9, 10, 11, 12, 14, 23, 23, 23, 24, 52, 52, 52, 52,52,52,52,52,52,52,52,52,52,65,65,65,65,65,76,76,76,76,3453,23423]
end

def solution1
  @n = 0
  start_index = 0
  end_index = @array.count - 1
  middle_index = end_index/2.ceil

  @array[start_index...middle_index].each_with_index do |current_num, current_index|

    temp = @array[current_index]
    @n += 1
    @array[current_index] = @array[end_index - current_index]
    @array[end_index - current_index] = temp
  end
  puts "solution 1, n is #{@n}"
  @array
end

set_array
puts "solution1 is #{solution1}"
set_array
#puts "solution2 is #{solution2(130)}"