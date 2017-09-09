class TravelStop
  attr_accessor :city, :distance

  def initialize(args = {})
    @city = args[:city]
    @distance = args[:distance]
  end

  def city_name
    city.city_name
  end
end
