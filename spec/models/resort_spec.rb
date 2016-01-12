require 'rails_helper'

describe Resort do

  it "has a valid factory" do

    expect(build(:resort)).to be_valid

  end

  let(:direction) { build(:direction) }
  let(:resort2) { build(:resort, name: "resort 2",location: "37.8846276,-108.6657078") }
  let(:resort) { build(:resort) }

  describe "attribute accessors" do

    it { expect(resort).to have_attr_accessor(:distance_text) }
    it { expect(resort).to have_attr_accessor(:distance_value) }

  end

  describe "ActiveModel validations" do

    # Basic validations
    it { expect(resort).to validate_presence_of(:name) }
    it { expect(resort).to validate_uniqueness_of(:name) }

  end

  describe "ActiveRecord associations" do

    # Associations
    it { expect(resort).to have_many(:tweets) }

  end

  describe "scopes" do
    it ".group returns all resorts in group" do

    end
  end

  describe "public instance methods" do
    context "responds to its methods" do
      it { expect(resort).to respond_to(:add_distance) }
    end

    context "executes methods correctly" do
      context "#add_distance" do
        it "adds mapped distances to resorts" do
          resort = create(:resort)
          geo = Geolocator.new(direction.from)
          json = geo.json

          resort.add_distance({"distance"=>{"text"=>"264 mi", "value"=>424271},
            "duration"=>{"text"=>"4 hours 47 mins", "value"=>17192},
            "status"=>"OK"})

          expect(resort.distance_text).to include('mi')
          expect(resort.distance_value).to be > 0

        end
        it "when returns no results adds default distances to resorts " do

          resort = create(:resort)
          geo = Geolocator.new(direction.from)
          json = geo.json

          resort.add_distance({"distance"=>{"text"=>"", "value"=>0},
            "duration"=>{"text"=>"", "value"=>0},
            "status"=>"ZERO_RESULTS"})

          expect(resort.distance_text).to include('No Result')
          expect(resort.distance_value).to eq(100000000000)
        end

      end
    end
  end
  describe "public class methods" do
    context "responds to its methods" do

      it { expect(Resort).to respond_to(:sort_by_distance) }

    end

    context "executes methods correctly" do
      context "self.sort_by_distance" do
        it "sorts resorts by distance" do
          resort2 = create(:resort, name: "resort 2",location: "37.8846276,-108.6657078")
          resort = create(:resort)

          geo = Geolocator.new(direction.from)
          resorts = geo.distance
          resorts = Resort.sort_by_distance(resorts)
          expect(resorts.first).to eq(resort)
        end
      end
    end
  end
end
