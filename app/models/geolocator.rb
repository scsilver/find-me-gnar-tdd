class Geolocator
  attr_accessor :from, :api_key, :distance_from

  def initialize(from)

    self.from = from
    self.api_key = ENV["GEO_API_KEY"]

  end

  def json

    url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{from_param}&destinations=#{destination_param}&key=#{api_key}&units=imperial"
    self.distance_from = HTTParty.get url

  end

  def distance
    json
    resorts.each_with_index do |resort, i|
      resort.add_distance(distance_from['rows'][0]['elements'][i])
    end

  end

  def from_param

    CGI.escape from

  end

  def resorts
    Resort.all
  end

  def destination_param

    CGI.escape resorts.map(&:location).join('|')

  end

end
