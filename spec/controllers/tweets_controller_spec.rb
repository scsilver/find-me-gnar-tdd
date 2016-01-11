require 'rails_helper'

describe 'TweetsController' do
  it 'can create new tweet' do
    tweet = create(:tweet)
    expect(tweet).to not be nil
  end
  

end
