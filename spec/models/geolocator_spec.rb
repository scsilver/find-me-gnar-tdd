require 'rails_helper'
require 'spec_helper'


describe 'Geolocator' do
  context 'locate' do
    before(:example) do

      resort = create :resort


    end
    it 'returns json' do
      direction = create :direction


      geo = Geolocator.new(direction.from)

      json = geo.json
      puts json.class
      expect { JSON.parse(json.body) }.to_not raise_error
    end
    it 'finds distance from user searched location' do
      direction = create :direction


      geo = Geolocator.new(direction.from)

      distance = geo.json['rows'][0]['elements'][0]['distance']['text']




      expect(distance).to include('mi')

    end

    it 'adds distance to resorts' do
      direction = create :direction

      geo = Geolocator.new(direction.from)


      resort2 = create(:resort, name: "resort 2",location: "37.8846276,-108.6657078")

      json = geo.json

      resort2.add_distance(json['rows'][0]['elements'][0])

      expect(resort2.distance_text).to include('mi')


    end
  end


end
