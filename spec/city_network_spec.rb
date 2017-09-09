require_relative '../utils.rb'
require_relative '../fifo.rb'
require_relative '../city.rb'
require_relative '../node.rb'
require_relative '../city_node.rb'
require_relative '../graph.rb'
require_relative '../city_network.rb'
require_relative '../travel_stop.rb'

RSpec.describe CityNetwork do

  let(:cities)  { read_cities_from_file File.join(__dir__, '..', 'cities.txt') }

  def check_source_data
    expect(cities.size).to eq 32
  end

  before(:each) do
    check_source_data
  end

  describe 'initialization' do
    let(:subject) { CityNetwork.new({cities: cities}) }

    it 'populates graph with cities' do
      expect(subject.nodes.size).to eq 32
    end

    it 'connects all cities with each other' do
      subject.nodes.each do |city|
        expect(city.neighbours.size).to eq 31
      end
    end
  end
  
  describe '#generate_route_from' do
    let(:city_network) { CityNetwork.new({cities: cities}) }
    let(:origin)       { 'Beijing' }
    let(:subject)      { city_network.generate_route_from(origin) }

    it 'returns an ordered array of cities', :aggregate_failures do
      expect(subject).to be_a Array
      expect(subject.size).to eq 32
    end

    it 'raises and error if origin is missing' do
      origin = nil
      expect { city_network.generate_route_from(origin) }.to raise_error ArgumentError
    end

    it 'raises and error if origin is not in cities list' do
      origin = "Any dummy"
      expect { city_network.generate_route_from(origin) }.to raise_error ArgumentError
    end
  end
end