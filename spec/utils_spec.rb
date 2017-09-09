require_relative '../utils.rb'

RSpec.describe 'utils#read_cities_from_file' do
  it 'returns an empty array if the source file is not found' do
    expect(read_cities_from_file File.join(__dir__, 'dummy.txt')).to be_empty
  end

  context 'with a file with valid cities' do
    let(:subject) { read_cities_from_file File.join(__dir__, '..', 'cities.txt') }

    it 'returns an array' do
      expect(subject.class).to eq Array
    end

    it 'returns an array with City instances' do
      subject.each do |city|
        expect(city.class).to be City
      end
    end
  end

  context 'with a file with valid cities' do
    let(:subject) { read_cities_from_file File.join(__dir__, '..', 'cities_for_testing_with_invalid_city.txt') }

    it 'returns an array' do
      expect(subject.class).to eq Array
    end

    it 'returns an array with City instances' do
      subject.each do |city|
        expect(city.class).to be City
      end
    end

    it 'the invalid city gets ignored' do
      expect(subject.size).to eq 3
    end
  end
end
