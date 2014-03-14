require 'thread'

#Write the algorihm for DFS and BFS, recursively and ineratively

class Node
  attr_accessor :nodes, :value, :visited

  def initialize(value, nodes = [])
    @value = value
    @nodes = []
  end
end

@output = []

#recursive
def solution1_depth_first_search(node)
  node.visited = true
  @output << node.value

  node.nodes.each do |node|
    unless node.visited
      solution1_depth_first_search(node)
    end
  end
end

#iterative
def solution2_depth_first_search(node)
  visited = []
  stack = []
  stack << node

  while(!stack.empty?) do
    current_node = stack.pop

    unless current_node.visited
      visited << current_node.value
      current_node.visited = true
      current_node.nodes.each do |next_node|
        stack << next_node
      end
    end
  end

  visited
end

#recursive
@output2 = []
def solution3_breath_first_search(node)
  visited = []
  queue = Queue.new
  queue << node

  while(!queue.empty?) do
    current_node = queue.pop

    unless current_node.visited
      current_node.visited = true
      visited << current_node.value
    end

    current_node.nodes.each do |next_node|
      queue << next_node
    end
  end

  visited
end

a = Node.new("A")
b = Node.new("B")
c = Node.new("C")
d = Node.new("D")
e = Node.new("E")

a.nodes << b
a.nodes << c
b.nodes << d
c.nodes << d
c.nodes << e

solution1_depth_first_search(a)
puts "solution1 is #{@output}"

a = Node.new("A")
b = Node.new("B")
c = Node.new("C")
d = Node.new("D")
e = Node.new("E")

a.nodes << b
a.nodes << c
b.nodes << d
c.nodes << d
c.nodes << e

puts "solution2 is #{solution2_depth_first_search(a)}"

a = Node.new("A")
b = Node.new("B")
c = Node.new("C")
d = Node.new("D")
e = Node.new("E")

a.nodes << b
a.nodes << c
b.nodes << d
c.nodes << d
c.nodes << e

puts "solution3 is #{solution3_breath_first_search(a)}"
