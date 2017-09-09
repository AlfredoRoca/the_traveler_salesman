class Fifo
  attr_accessor :array

  def initialize
    @array = Array.new
  end

  def enqueue item
    @array.push item
  end

  def dequeue
    @array.shift unless self.empty?
  end

  def empty?
    @array.empty?
  end

  def dequeue_min_distance
    @array.sort! { |a, b| a.class == TravelStop ? a.send(:distance) <=> b.send(:distance) : a[:distance] <=> b[:distance] }.shift
  end
end
