require 'thread'

#Given a direct graph, design an algorithm to find out wheter there is a route between two nodes

class Node
  attr_accessor :nodes, :value, :visited

  def initialize(value, nodes = [])
    @value = value
    @nodes = []
  end
end

@output = []

#recursive
def solution1_depth_first_search(node1, node2)
  @output<<node1.value
  node1.visited = true

  if node1.value == node2.value
    return true
  end

  results = []
  node1.nodes.each do |next_node|
    unless next_node.visited
      if solution1_depth_first_search(next_node, node2) == true
        results << true
      else
        results << false
      end
    end
  end

  results.include?(true)
end

a = Node.new("A")
b = Node.new("B")
c = Node.new("C")
d = Node.new("D")
e = Node.new("E")
f = Node.new("F")

a.nodes << b
a.nodes << c
b.nodes << d
b.nodes << a
c.nodes << d
c.nodes << e
d.nodes << f
f.nodes << b

puts "solution1 is #{solution1_depth_first_search(f,e)}"
puts "solution1 visited is #{@output}"