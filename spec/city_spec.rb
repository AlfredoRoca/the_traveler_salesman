require_relative '../city.rb'

RSpec.describe City do

  it 'raises an error if some GPS coordinate is missing', :aggregate_failures do
    expect { City.new({name: "Pepe", lon: 0}) }.to raise_error(ArgumentError)
    expect { City.new({name: "Pepe", lat: 0}) }.to raise_error(ArgumentError)
    expect { City.new({name: "Pepe"}) }.to raise_error(ArgumentError)
  end

  it 'raises an error if some GPS coordinate is nil', :aggregate_failures do
    expect { City.new({name: "Pepe", lat: nil, lon: 0}) }.to raise_error(ArgumentError)
    expect { City.new({name: "Pepe", lat: 0, lon: nil}) }.to raise_error(ArgumentError)
    expect { City.new({name: "Pepe", lat: nil, lon: nil}) }.to raise_error(ArgumentError)
  end

  it 'assigns a dummy name if name is empty' do
    city = City.new({name: "", lat: 0, lon: 0})
    expect(city.name).to eq '???'
  end

  it 'assigns a dummy name if name is missing' do
    city = City.new({lat: 0, lon: 0})
    expect(city.name).to eq '???'
  end
end
