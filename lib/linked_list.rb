require './lib/node.rb'

class LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end

  def append(data)
    @head = Node.new(data)
  end

  def count
    if head.nil?
      0
    else
      1
    end
  end

  def to_string
    @head.data.to_s
  end
end
