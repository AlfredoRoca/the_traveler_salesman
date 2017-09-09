require_relative '../fifo.rb'

RSpec.describe Queue, '#dequeue_min_distance' do

  fifo = Fifo.new
  fifo.enqueue({name: "A", distance: 34})
  fifo.enqueue({name: "B", distance: 23})
  fifo.enqueue({name: "C", distance: 99})
  fifo.enqueue({name: "D", distance: 30})

  it "returns and removes the item with min distance" do
    item = fifo.dequeue_min_distance
    expect(item[:distance]).to eq 23
    expect(fifo.array.index(item)).to be nil
    expect(fifo.array.size).to eq 3
  end

end
