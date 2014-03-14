# create a method that validates a sodoku puzzle

test_data = [
    [1,2,3,4,5,6,7,8,9],
    [4,5,6,7,8,9,1,2,3],
    [7,8,9,1,2,3,4,5,6],
    [2,3,4,5,6,7,8,9,1],
    [5,6,7,8,9,1,2,3,4],
    [8,9,1,2,3,4,5,6,7],
    [3,4,5,6,7,8,9,1,2],
    [6,7,8,9,1,2,3,4,5],
    [9,1,2,3,4,5,6,7,8]
]

def validate(matrix)

  # check row
  puts "check row"
  matrix.each do |row|
    unless set_valid?(row)
      return false
    end
  end

  # check column
  puts "check column"
  for column_num in 0..8 do
    column = []

    matrix.each do |row|
      column << row[column_num]
    end

    unless set_valid?(column)
      return false
    end
  end

  #check 3x3
  puts "check 3x3"
  for across in 0..2 do
    across_offset = across * 3

    for down in 0..2 do
      down_offset = down * 3

      # check column
      values = []
      for column_num in 0+across_offset..2+across_offset do
        for row_num in 0+down_offset..2+down_offset do
          values << matrix[row_num][column_num]
        end
      end

      unless set_valid?(values)
        puts values.inspect
        return false
      end
    end
  end

  true
end

def set_valid?(values)
  if values.count != 9
    return false
  end

  all_numbers = [1,2,3,4,5,6,7,8,9]
  values.each do |value|
    all_numbers.delete(value)
  end

  all_numbers.empty?
end

puts "the result is #{validate(test_data)}"