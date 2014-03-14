#given a list of numbers, return the indexes of two values whose sum is a given value

@array = [1, 2, 4, 7, 7, 7, 7, 7, 9, 10, 11, 12, 14, 23, 23, 23, 24, 52, 52, 52, 52,52,52,52,52,52,52,52,52,52,65,65,65,65,65,76,76,76,76,3453,23423]

def solution1(value)
  @n = 0

  to_return = []

  @array.each_with_index do |first_num, first_num_index|
    sum = 0
    @n += 1
    if value > first_num
      sum += first_num

      #puts "first_num is #{first_num}"
      @array.each_with_index do |second_num, second_num_index|
        @n += 1
        if value > second_num
          #puts "second_num is #{second_num}"
          if value == sum + second_num
            to_return = [first_num_index, second_num_index]
          end
        else
          next
        end
      end
    else
      next
    end

    unless to_return.empty?
      break
    end
  end
  puts "solution 1, n is #{@n}"
  to_return
end


def solution2(value)
  @n = 0
  start_index = 0
  end_index = @array.count - 1

  to_return = []

  @array.each_with_index do |first_num, first_num_index|
    start_index += 1
    sum = 0
    @n += 1
    if value > first_num
      sum += first_num

      #puts "first_num is #{first_num}"
      @array[start_index...end_index].each_with_index do |second_num, second_num_index|
        @n += 1
        if value > second_num
          #puts "second_num is #{second_num}"
          if value == sum + second_num
            to_return = [first_num_index, second_num_index + start_index]
          end
        else
          next
        end
      end
    else
      next
    end

    unless to_return.empty?
      break
    end
  end
  puts "solution 2, n is #{@n}"
  to_return
end


puts "solution1 is #{solution1(130)}"
puts "solution2 is #{solution2(130)}"