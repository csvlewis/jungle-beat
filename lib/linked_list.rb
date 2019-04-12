require './lib/node.rb'
require 'pry'

class LinkedList
  attr_reader :head,
              :count
  def initialize
    @head = nil
    @count = 0
    @data = []
  end

  def append(data)
    node = Node.new(data)
    if @head.nil?
      @head = node
    else
      @head.set_next(node)
    end
    @count += 1
    @data << node.data
    data
  end

  def prepend(data)
    node = Node.new(data)
    node.set_next(@head) if @head
    @head = node
    @count += 1
    @data.unshift(node.data)
    data
  end

  def insert(position, data)
    new_node = Node.new(data)
    if position.zero? || @head.nil?
      self.prepend(data)
    elsif position == 1
      new_node.set_next(@head.next_node)
      @head.clear_nodes
      @head.set_next(new_node)
      @count += 1
      @data.insert(position, data)
      data
    else
      new_node = Node.new(data)
      array = []
      (position - 1).times do
        array << 'next_node'
      end
      searched_node = @head.chain_methods(array)
      new_node.set_next(searched_node.next_node)
      searched_node.clear_nodes
      searched_node.set_next(new_node)
      @count += 1
      @data.insert(position, data)
      data
    end
  end

  def includes?(value)
    if @data.include?(value)
      true
    else
      false
    end
  end

  def pop
    if @count.zero?
    elsif @count == 1
      @head = nil
    elsif @count == 2
      @head.clear_nodes
    elsif @count > 2
      array = []
      (@count - 2).times do
        array << 'next_node'
      end
      searched_node = @head.chain_methods(array)
      searched_node.clear_nodes
    end
    @count -= 1 unless count.zero?
    @data.pop
  end

  def to_string
    strings = @data.map(&:to_s)
    strings.join(' ')
  end
end
