# The traveler salesman

**Scenario:**

You are a successful salesman working for a big company. You have 32 big accounts around the globe to visit on a periodic basis, and you have been assigned the project of saving money on your already dilated travel expense allowance. Given a list of your companies' GPS locations, the script will help you find the shortest path to visit all 32 places once.

**Input file specifications**

The input file will contain a listing of cities and coordinates in a tab-delimited file. The filename is named exactly `cities.txt` is located on the same directory where the script is executed. There are no additional spaces or lines at the begging or end of the file.

The schema for this file is as follows: 

    <city name> \t <latitude> \t <longitude> \n

An example input file: 

    Beijing     39.93   116.40
    Vladivostok 43.8    131.54
    Dakar       14.40   -17.28
    Singapore   1.14    103.55 
     (...)

**Installation**

With RVM:

Edit `.ruby-version` and change proper value (ruby version > 2.2 should work)

    gem install bundler
    bundle install


**Usage:**

    ruby shortest_path_tree_from.rb Beijing [-map]

This script does the following:

It creates a list of cities from an external file

    cities = read_cities_from_file File.join(__dir__, 'cities.txt')

It creates a graph where each node is a city

    g = CityNetwork.new({cities: cities})

It generates a travel plan

    travel_route = g.generate_route_from ARGV[0]

And prints it on screen.

**Output**

    Beijing
    Vladivostok
    Tokyo
    Bangkok
    Singapore
    Perth
    Melbourne
    Auckland
    San Francisco
    Vancouver
    Anchorage
    Toronto
    New York
    Caracas
    San Jose
    Mexico City
    Lima
    Rio
    Santiago
    Dakar
    Accra
    Casablanca
    Paris
    London
    Prague
    Moscow
    Astana
    New Delhi
    Jerusalem
    Cairo
    Lusaka
    Reykjavík

Alternatively, with parameter `-map` prints the following list to be entered in https://mapcustomizer.com

    Generating graph...
    Calculating shortest path tree from Beijing...
    ================================================================================
    List of pins for mapcustomizer.com -> create a new map and bulk entry the following list
    ================================================================================
    39.93, 116.4 {Beijing}
    43.8, 131.54 {Vladivostok}
    35.4, 139.45 {Tokyo}
    13.45, 100.3 {Bangkok}
    1.14, 103.55 {Singapore}
    -31.57, 115.52 {Perth}
    -37.47, 144.58 {Melbourne}
    -36.52, 174.45 {Auckland}
    37.47, -122.26 {San Francisco}
    49.16, -123.07 {Vancouver}
    61.17, -150.02 {Anchorage}
    43.4, -79.24 {Toronto}
    40.47, -73.58 {New York}
    10.28, -67.2 {Caracas}
    9.55, -84.02 {San Jose}
    19.26, -99.7 {Mexico City}
    -12.0, -77.2 {Lima}
    -22.57, -43.12 {Rio}
    -12.56, -38.27 {Santiago}
    14.4, -17.28 {Dakar}
    5.35, -0.06 {Accra}
    33.35, -7.39 {Casablanca}
    48.86, 2.34 {Paris}
    51.32, -0.5 {London}
    50.5, 14.26 {Prague}
    55.45, 37.36 {Moscow}
    51.1, 71.3 {Astana}
    28.6, 77.22 {New Delhi}
    31.78, 35.22 {Jerusalem}
    30.2, 31.21 {Cairo}
    -15.25, 28.16 {Lusaka}
    64.4, -21.58 {Reykjavík}
    ================================================================================
    Total distance: 91870633
    ================================================================================

**Visualizing data on a map**

Visit [Map Customizer](https://www.mapcustomizer.com/), create a new map and bulk entry the printed list to pin point cities in visiting order.

**Testing**

Execute `rspec`

**Technical**

About [Travelling salesman problem](https://en.wikipedia.org/wiki/Travelling_salesman_problem) (TSP)

Haversine formula is used to calculate the distance between cities: <https://en.wikipedia.org/wiki/Haversine_formula>

A brute force solution exploring all permutations is impossible with 32 cities because O(n!).

The algorithm used is the [Nearest Neighbour algorithm](https://en.wikipedia.org/wiki/Nearest_neighbour_algorithm):

It is not the optimal solution but good enough and a quick aproximation.
