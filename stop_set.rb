class StopSet < Set
  attr_accessor :array

  def initialize
    @array = Array.new
  end

  def put item
    @array.push item
  end

  def empty?
    @array.empty?
  end

  def get_min_distance
    @array.sort! { |a, b| a.class == TravelStop ? a.send(:distance) <=> b.send(:distance) : a[:distance] <=> b[:distance] }.shift
  end
end
