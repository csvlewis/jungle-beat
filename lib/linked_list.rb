require './lib/node.rb'
require 'pry'

class LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end

  def append(data)
    node = Node.new(data)
    if @head.nil?
      @head = node
    else
      @head.set_next(node)
    end
  end

  def count
    if @head.nil?
      0
    else
      1
    end
  end

  def to_string
    @head.data.to_s
  end
end
