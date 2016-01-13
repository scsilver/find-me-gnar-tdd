require 'rails_helper'
#require 'spec_helper'


describe Geolocator do
    before(:example) do

      resort = create(:resort,location: "37.8846276,-107.6657078")
      resort2 = create(:resort, name: "resort 2",location: "37.8846276,-108.6657078")
      direction = build(:direction,from: "715 Arapahoe Ave, Boulder Co")

      @geolocator = Geolocator.new(direction.from)

    end

    let(:direction) { build(:direction) }
    let(:resort2) { build(:resort, name: "resort 2",location: "37.8846276,-108.6657078") }
    let(:resort) { build(:resort) }

    describe "attribute accessors" do

      it { expect(@geolocator).to have_attr_accessor(:from) }
      it { expect(@geolocator).to have_attr_accessor(:api_key) }
      it { expect(@geolocator).to have_attr_accessor(:distance_from) }


    end

    describe "scopes" do
      it ".group returns all resorts in group" do

      end
    end

    describe "public instance methods" do
      context "responds to its methods" do

        it { expect(@geolocator).to respond_to(:json) }
        it { expect(@geolocator).to respond_to(:distance) }
        it { expect(@geolocator).to respond_to(:from_param) }
        it { expect(@geolocator).to respond_to(:destination_param) }

      end

      context "executes methods correctly" do
        context "#initialize" do
          it "initializes resorts" do

            geolocator = Geolocator.new(direction.from)

            expect(geolocator.from).to eq(direction.from)
            expect(geolocator.api_key).to eq(ENV["GEO_API_KEY"])

          end
        end


        context "#json" do
          it "returns valid httparty json of distances" do

            json = @geolocator.json

            #expect(geolocator.distance_from['rows'][0]['elements'][0]['distance']['text']).to include('mi')
            expect { JSON.parse(json.body) }.to_not raise_error
            end
          end


        context "#distance" do

          it "calls json" do

            resorts = @geolocator.distance

            expect(@geolocator.distance_from).to be_truthy

          end

          it "adds distances to each resort in a resorts collection" do

            resorts = @geolocator.distance

            expect(resorts.first.distance_text).to include('mi')

          end
        end

        context "#from_param" do
          it "cgi escapes gelocator.from" do

            from_param = @geolocator.from_param

            expect(from_param).to eq("715+Arapahoe+Ave%2C+Boulder+Co")

          end
        end

        context "#resorts" do
          it "returns new resorts collection of all resorts" do

            resorts = @geolocator.resorts

            expect(resorts).to eq(Resort.all)

          end
        end

        context "#destination_param" do
          it "cgi escapes string of resorts locations seperated by '|''" do

            destination_param = @geolocator.destination_param

            expect(destination_param).to eq("37.8846276%2C-107.6657078%7C37.8846276%2C-108.6657078" )

          end
        end
      end
    end
end
