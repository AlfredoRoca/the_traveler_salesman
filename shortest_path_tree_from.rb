require_relative 'utils.rb'
require_relative 'fifo.rb'
require_relative 'city.rb'
require_relative 'node.rb'
require_relative 'city_node.rb'
require_relative 'graph.rb'
require_relative 'city_network.rb'
require_relative 'travel_stop.rb'

cities = read_cities_from_file File.join(__dir__, 'cities.txt')
g = CityNetwork.new({cities: cities})

origin = ARGV[0]
travel_route = g.generate_route_from origin

if ARGV.include?('-map')
  # prints a list to bulk enter at https://www.mapcustomizer.com
  puts '=' * 80
  puts "List of pins for mapcustomizer.com -> create a new map and bulk entry the following list"
  puts '=' * 80
  travel_route.map { |stop| puts stop.city.print_pin_data }

  puts '=' * 80
  puts "Total distance: #{travel_route.last.distance}"
  puts '=' * 80

else
  # prints only the list of cities in order
  travel_route.map { |stop| puts stop.city.city_name }
end
