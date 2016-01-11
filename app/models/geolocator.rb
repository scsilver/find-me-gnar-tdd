class Geolocator
  attr_accessor :from, :api_key, :distance_from
  def initialize(from)
    self.from = from
    self.api_key = \
      'AIzaSyBb3ZSbRxq6PQSsJmpTT9bR79HghrI9_LE'
  end
  def json
    url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{address_param}&destinations=#{destination_param}&key=#{api_key}&units=imperial"
    self.distance_from = HTTParty.get url
  end

  def distance
    resorts = Resort.all
    resorts.each_with_index do |resort, i|
          resort.add_distance(distance_from['rows'][0]['elements'][i])
        end
  end
  def address_param
    CGI.escape from
  end

  def destination_param
    resorts = Resort.all
    CGI.escape resorts.map(&:location).join('|')
  end
  def locate
  resorts.each_with_index do |resort, i|
    resort.add_distance(distance_from['rows'][0]['elements'][i])
    end
  # GetStats.update(resort)
  end
end
