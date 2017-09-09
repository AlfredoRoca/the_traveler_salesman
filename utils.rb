def read_cities_from_file cities_file
  return [] unless File.exist?(cities_file)

  cities = Array.new
  file_lines = IO.readlines(cities_file)
  file_lines.each do |line|
    city_name, lat, lon = line.split(/[\t|\n]/)
    begin
      cities.push City.new({name: city_name, lat: lat, lon: lon})
    rescue StandardError => e
      puts e.message, "Error in line: #{line}"
    end
  end
  return cities
end
