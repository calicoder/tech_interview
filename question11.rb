#Implement Merge Sort and Quick Sort

@array = [1, 2, 4, 7, 7, 7, 7, 7, 9, 10, 11, 12, 14, 23, 23, 23, 24, 41, 48, 50, 51, 52, 52, 52, 52, 56, 56, 59, 59, 62, 62, 65, 65, 65, 65, 65, 76, 76, 76, 76, 3453, 23423]
@array.each_with_index do |num, index|
  temp_index = rand*@array.length
  temp_val = @array[temp_index]
  @array[index] = temp_val
  @array[temp_index] = num
end

def solution1(list)
  @n = 0
  solution1_merge_sort(list)
end

def solution1_merge_sort(list)
  @n += 1

  if list.count <=1
    return list
  end

  middle_index = list.count/2.ceil

  left_list = solution1_merge_sort(list[0...middle_index])
  right_list = solution1_merge_sort(list[middle_index...list.count])

  #puts "left_list count = #{left_list.count}, right_list count = #{left_list.count}"
  #puts "list_count = #{list.count}, middle_index is #{middle_index}, list[0...middle_index] count = #{list[0...middle_index].inspect}, list[middle_index...list.count - 1] count = #{list[middle_index...list.count - 1].inspect}"
  solution1_merge(left_list, right_list)
end

def solution1_merge(left_list, right_list)
  #puts "left_list count = #{left_list.inspect}, right_list count = #{right_list.inspect}"
  return_array = []

  left_counter = 0
  right_counter = 0

  while (left_counter < left_list.count or right_counter < right_list.count) do
    @n += 1
    if left_counter >= left_list.count
      return_array << right_list[right_counter]
      right_counter +=1
    elsif right_counter >= right_list.count
      return_array << left_list[left_counter]
      left_counter +=1
    else
      if left_list[left_counter] < right_list[right_counter]
        return_array << left_list[left_counter]
        left_counter +=1
      else
        return_array << right_list[right_counter]
        right_counter +=1
      end
    end
  end

  return_array
end

def solution2_quick_sort(list)

end

def solution2_partition(list)
  #find a arbitrary pivot (lets just go with the first element)
  pivot = list[0]

  left_counter = 1
  right_counter = list.count - 1

  #puts pivot
  #while the counters do not equal
  while (left_counter <= right_counter)
    puts "left counter #{left_counter} with value #{list[left_counter]}, right counter #{right_counter} with value #{list[right_counter]} for pivot #{pivot}"

    if list[left_counter] >= pivot
      left_swap = list[left_counter]
    else
      left_swap = nil
      left_counter += 1
    end

    if list[right_counter] <= pivot
      right_swap = list[right_counter]
    else
      right_swap = nil
      right_counter -= 1
    end

    if left_swap and right_swap
      puts "swapping left counter #{left_counter} with value #{left_swap}, right counter #{right_counter} with value #{right_swap}"
      list[right_counter] = left_swap
      list[left_counter] = right_swap
      left_counter += 1
      right_counter -= 1
    end
  end

  #swap pivot at 0 with the counter - 1
  #zeroth_element = list[0]
  #list[0] = list[left_counter - 1]
  #list[left_counter - 1] = zeroth_element

  list
end

def solution2(list)
  solution2_partition(list)
end



#puts "soluti 1 unsorted is #{@array}"
#puts "solution 1 sorted is #{solution1(@array)}"
#puts "solution 1 O(n) is #{@n}"
#
puts ""

puts "soluti 2 unsorted is #{@array}"
#puts @array.count
puts "solution 2 sorted is #{solution2(@array)}"
#puts solution2(@array).count
