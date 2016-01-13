require 'rails_helper'

describe DirectionsController, type: :controller do
  before(:example) do
    resort = create :resort
    resort2 = create(:resort, name: "resort 2",location: "37.8846276,-108.6657078")
    @direction = create :direction
    geo = Geolocator.new(@direction.from)
    resorts = geo.distance

  end
  describe "GET #show" do
    it "returns http success" do
      get :show, id: @direction.id
      expect(response).to have_http_status(:success)
    end
  end
end
