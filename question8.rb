#Implement a function to check if a tree is balanced

class Node
  attr_accessor :left, :right
end


def solution1_max_depth(root)
  unless root
    return 0
  end

  1 + [solution1_max_depth(root.left), solution1_max_depth(root.right)].max
end

def solution1_min_depth(root)
  unless root
    return 0
  end

  1 + [solution1_min_depth(root.left), solution1_min_depth(root.right)].min
end

def solution1(root)
  solution1_max_depth(root) - solution1_min_depth(root) <= 1
end


root = Node.new
left = Node.new
right = Node.new
right2 = Node.new
right3 = Node.new
right.right = right2
right2.right = right3

root.left = left
root.right = right


puts "solution1 is #{solution1(root)}"
