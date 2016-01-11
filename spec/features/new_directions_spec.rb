require 'rails_helper'

feature 'can geolocate' do
  scenario 'can find closest resorts' do
    visit '/'
    fill_in 'Location', with: '715 Arapahoe Ave, Boulder Colorado'
    click_button 'Submit'
    expect(page).to have_content('Eldora')
  end
end
