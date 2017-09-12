require_relative '../stop_set.rb'

RSpec.describe StopSet, '#get_min_distance' do

  set = StopSet.new
  set.put({name: "A", distance: 34})
  set.put({name: "B", distance: 23})
  set.put({name: "C", distance: 99})
  set.put({name: "D", distance: 30})

  it "returns and removes the item with min distance" do
    item = set.get_min_distance
    expect(item[:distance]).to eq 23
    expect(set.array.index(item)).to be nil
    expect(set.array.size).to eq 3
  end

end
