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

  def to_string
    strings = @data.map(&:to_s)
    strings.join(' ')
  end
end
