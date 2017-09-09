class Node
  attr_accessor :neighbours

  def initialize(args = {})
    @neighbours = []
    post_initialize args
  end

  def post_initialize args
    nil
  end
end
