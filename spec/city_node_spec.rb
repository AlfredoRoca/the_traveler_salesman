require_relative '../node.rb'
require_relative '../city_node.rb'

RSpec.describe CityNode do

  context 'with valid data' do
    let(:city1)     { City.new({name: "Beijing", lat: 39.93, lon: 116.40}) }
    let(:node_city) { CityNode.new(city: city1) }
    let(:city2)     { City.new({name: "Paris", lat: 48.86, lon: 2.34}) }
    let(:neighbour) { CityNode.new(city: city2) }

    it 'creates an instance with City data' do
      expect(node_city).to be_a CityNode
    end

    describe '#calculate_distance_to' do
      it 'returns 0 between the same node' do
        expect(node_city.calculate_distance_to node_city).to eq 0
      end

      it 'returns the distance between two nodes' do
        expect(node_city.calculate_distance_to neighbour).to be_within(100).of(8_214_760) #distance measured in GMaps
      end
    end

    describe '#add_neighbour' do
      it 'adds a new neighbour', :aggregate_failures do
        node_city.add_neighbour neighbour
        expect(node_city.neighbours.size).to eq 1
        expect(node_city.neighbours.first[:name]).to eq neighbour.city_name
        expect(node_city.neighbours.first[:distance]).to be_within(1).of(node_city.calculate_distance_to(neighbour))
      end
    end
  end
end
