require 'rails_helper'

feature 'geolocator' do
  feature 'can find closest resorts' do
    background do
      resort = create :resort
      resort2 = create(:resort, name: "resort 2",location: "37.8846276,-108.6657078")
      visit '/'
      click_link 'Closest Mountains'
      fill_in 'Location', with: '715 Arapahoe Ave, Boulder Colorado'
      click_button 'Submit'
    end

    scenario 'can display closest resorts' do

      expect(page).to have_content('Eldora')
      expect(page.body.index('Eldora')).to be < page.body.index('resort 2')

    end

    scenario 'can click on closest resorts and show directions' do

      click_link 'Eldora'

      expect(page).to hav_css('googe/bing map image')

    end

    scenario 'can click on closest resorts and show COTRIP road cams along way' do

      click_link 'Eldora'

      expect(page).to hav_css('relevent road cams')

    end

    scenario 'can click on closest resorts and show current stats' do
      click_link 'Eldora'

      expect(page).to hav_css('googe/bing map image')

    end

    scenario 'can click on closest resorts and show instagram photos' do
      click_link 'Eldora'

      expect(page).to hav_css('instagram feed')

    end

    scenario 'can click on closest resorts and show tweets' do
      click_link 'Eldora'

      expect(page).to hav_css('tweets')

    end

  end

end
