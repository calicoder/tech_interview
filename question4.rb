#merge 2 sorted arrays without having duplicates

@array1 = [1, 2, 7, 7, 7, 7, 9, 10, 11, 12, 14, 23, 23, 23, 24, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 65, 65, 65, 65, 65, 76, 76, 76, 76, 3453, 23423]
@array2 = [1, 4, 7, 7, 7, 7, 7, 10, 12, 14, 23, 23, 52, 52, 53, 54, 55, 56, 57, 61, 62, 63, 65, 65, 76, 76, 76, 76, 3453, 23423]


def solution1
  new_array = []
  first_index = 0
  first_index_end = @array1.count - 1
  second_index = 0
  second_index_end = @array2.count - 1

  @n = 0

  while(first_index <= first_index_end and second_index <= second_index_end) do
    @n += 1

    if first_index <= first_index_end
      first_num = @array1[first_index]
    else #out of numbers
      first_num = nil
    end

    if second_index <= second_index_end
      second_num = @array2[second_index]
    else #out of numbers
      second_num = nil
    end

    if first_num <= second_num
      if new_array.last != first_num
        new_array << first_num
      end

      first_index += 1
    else
      if new_array.last != second_num
        new_array << second_num
      end

      second_index += 1
    end
  end

  puts "solution 1, n is #{@n}"

  new_array
end

puts "solution1 is #{solution1}"
