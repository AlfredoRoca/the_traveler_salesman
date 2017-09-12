class CityNode < Node
  attr_accessor :city, :city_name, :lat, :lon

  def post_initialize(args)
    @city = args[:city]
    @city_name = @city.name
    @lat = @city.lat.to_f
    @lon = @city.lon.to_f
  end

  def add_neighbour city_node
    distance = calculate_distance_to city_node
    @neighbours.push({name: city_node.city_name, distance: distance.round})
  end

  def calculate_distance_to destination
    gps_distance(self.lat, self.lon, destination.lat, destination.lon)
  end

  def gps_distance(lat1, lon1, lat2, lon2)
    # source: https://en.wikipedia.org/wiki/Haversine_formula
    to_radians = Math::PI / 180 # Convert degrees to radians
    earth_radius = 6371e3 # metres
    lat1_in_rad = lat1 * to_radians
    lat2_in_rad = lat2 * to_radians
    delta_lat = lat2_in_rad - lat1_in_rad
    delta_lon = (lon2 - lon1) * to_radians

    a = Math.sin(delta_lat / 2.0)**2 + Math.cos(lat1_in_rad) * Math.cos(lat2_in_rad) * Math.sin(delta_lon / 2.0)**2;
    distance = 2 * earth_radius * Math.asin(Math.sqrt(a));
    distance
  end

  def to_s
    @city.to_s
  end

  def print_pin_data
    "#{lat}, #{lon} {#{city_name}}"
  end
end
