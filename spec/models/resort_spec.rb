require 'rails_helper'

describe 'Resort' do
  context 'when looking for directions' do
    before(:example) do
      @resort = create :resort
      resort2 = create(:resort, name: "resort 2",location: "37.8846276,-108.6657078")
      direction = create :direction
      @geo = Geolocator.new(direction.from)


    end
    it 'adds found distances to resorts' do

      json = @geo.json

      @resort.add_distance(json['rows'][0]['elements'][0])
      expect(@resort.distance_text).to include('mi')
      expect(@resort.distance_value).to be > 0
    end
    it 'sorts resorts by distance' do
      resorts = @geo.distance
      resorts = Resort.sort_by_distance(resorts)
      expect(resorts.first.distance_value).to be < resorts.last.distance_value
    end

  end
end
