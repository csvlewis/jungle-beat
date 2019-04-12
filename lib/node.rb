class Node
  attr_reader :data,
              :next_node
  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end

  def set_next(node)
    if @next_node.nil?
      @next_node = node
    else
      @next_node.set_next(node)
    end
  end
end
