require 'rails_helper'

feature 'can geolocate' do
  background do
    resort = create :resort
    resort2 = create(:resort, name: "resort 2",location: "37.8846276,-108.6657078")
  end
  scenario 'can find closest resorts' do
    visit '/'
    click_link 'Closest Mountains'
    fill_in 'Location', with: '715 Arapahoe Ave, Boulder Colorado'
    click_button 'Submit'
    expect(page).to have_content('Eldora')
    expect(page.body.index('Eldora')).to be < page.body.index('resort 2')
  end
end
