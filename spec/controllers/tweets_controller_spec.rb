require 'rails_helper'

describe TweetsController do

  describe 'Get Index' do
    before :each do
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
