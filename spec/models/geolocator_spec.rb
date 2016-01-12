require 'rails_helper'
require 'spec_helper'


describe Geolocator do

  context 'locate' do
    before(:example) do
      resort = create :resort
      resort2 = create(:resort, name: "resort 2",location: "37.8846276,-108.6657078")


    end
    it 'returns json' do
      direction = create :direction


      geo = Geolocator.new(direction.from)

      json = geo.json

      expect { JSON.parse(json.body) }.to_not raise_error
    end

    it 'finds distance from user searched location' do
      direction = create :direction

      geo = Geolocator.new(direction.from)

      distance = geo.json

      #expects json to be valid and returning miles and value data
      expect(distance['rows'][0]['elements'][0]['distance']['text']).to include('mi')
      expect(distance['rows'][0]['elements'][0]['distance']['value']).to be > 0
      #expects json to be valid and returning miles and value data and multiple resorts
      expect(distance['rows'][0]['elements'][1]['distance']['text']).to include('mi')
      expect(distance['rows'][0]['elements'][1]['distance']['value']).to be > 0
    end

    it 'adds distance to resorts' do
      direction = create :direction

      geo = Geolocator.new(direction.from)

      resorts = geo.distance

      expect(resorts.first.distance_text).to include('mi')
    end
  end


end
