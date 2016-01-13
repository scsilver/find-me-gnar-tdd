require 'rails_helper'

describe Tweet do
  it "has a valid factory" do

    expect(build(:tweet)).to be_valid

  end

  let(:tweet) { build(:tweet) }

  describe "ActiveRecord associations" do
    # Associations
    it { expect(tweet).to belong_to(:resort) }

  end
end
