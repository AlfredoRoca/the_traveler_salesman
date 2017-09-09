class City
  attr_accessor :name, :lat, :lon

  def initialize args
    @name = args[:name] || "???"
    @name = "???" if @name.empty?
    @lat = args[:lat]
    @lon = args[:lon]
    raise ArgumentError, "Not a valid GPS position, missing coordinate" if lat.nil? || lon.nil?
  end

  def to_s
    "Name: #{name} at (#{lat}, #{lon})"
  end
end
