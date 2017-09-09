class CityNetwork < Graph

  def post_initialize(args)
    nodes = args[:cities]
    populate_graph_with nodes
    connect_all_nodes
  end

  def populate_graph_with nodes
    nodes.each do |city|
      node = CityNode.new({city: city})
      add node
    end
  end

  def connect_all_nodes
    nodes.combination(2).each do |origin, destination|
      add_weighted_undirected_edge origin, destination
    end
  end

  def add_weighted_undirected_edge origin, destination
    origin.add_neighbour destination
    destination.add_neighbour origin
  end

  def generate_route_from origin_city_name = nil
    raise ArgumentError, "Missing Origin." if origin_city_name.nil?
    raise ArgumentError, "Origin not present in file." unless cities.any? { |city| city.city_name == origin_city_name }

    # ~Dijkstra
    travel_route = Graph.new
    visited_stops = Array.new
    fifo_stops = Fifo.new
    origin_graph_node = find_by_name(origin_city_name)

    stop = TravelStop.new({city: origin_graph_node, distance: 0}) # distance to himself is zero
    travel_route.add stop
    fifo_stops.enqueue(stop)

    # set infinite distance to the rest of nodes
    nodes.each do |node|
      unless node == origin_graph_node
        stop = TravelStop.new({city: node, distance: Float::INFINITY})
        travel_route.add stop
        fifo_stops.enqueue(stop)
      end
    end

    while !fifo_stops.empty?
      current_stop = fifo_stops.dequeue_min_distance
      visited_stops.push(current_stop.city_name)
      current_city = current_stop.city
      current_city.neighbours.each do |neighbour|
        unless visited_stops.include?(neighbour[:name])
          current_stop_in_travel_route = travel_route.find { |stop| stop.city_name == current_city.city_name }
          new_distance = current_stop_in_travel_route.distance + neighbour[:distance]
          neighbour_stop_in_travel_route = travel_route.find { |stop| stop.city_name == neighbour[:name] }
          neighbour_stop_in_travel_route.distance = new_distance 
        end
      end
    end

    travel_route.sort { |a,b| a.distance <=> b.distance }
  end

  def find_by_name name
    nodes.find { |node| node.city_name == name }
  end

  def cities
    nodes
  end
end
