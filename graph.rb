class Graph
  include Enumerable
  attr_accessor :nodes

  def initialize(args = {})
    @nodes = []
    post_initialize args
  end

  def add node
    nodes << node
  end

  def post_initialize args
    nil
  end

  def each(&block)
    @nodes.each(&block)
    self
  end
end
