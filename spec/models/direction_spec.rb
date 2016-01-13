require 'rails_helper'

describe Direction do
  describe Tweet do
    it "has a valid factory" do

      expect(build(:direction)).to be_valid

    end
  end
end
