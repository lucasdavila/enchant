require 'spec_helper'

feature 'App', :js => true do
  scenario 'sign in, upload a video and sign out' do
    user = User.create! :email => 'lucas@lucasdavi.la', :password => '12345678', :password_confirmation => '12345678', :name => 'lucas davila'

    VCR.use_cassette('chute', :record => :new_episodes) do
      visit '/'

      expect(page).to have_content 'CHANT IT UP'
      expect(page).to_not have_link 'SIGN OUT'

      click_link 'SIGN IN'

      expect(current_url).to match /facebook.com\/oauth\/authorize/

      visit new_user_session_path

      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button 'Sign in'

      expect(page).to have_content 'Signed in successfully.'
      expect(page).to_not have_link 'SIGN IN'

      attach_file 'chant_video', File.join(Rails.root, 'spec/fixtures/br.png')
      click_button 'SEND'

      click_link 'SIGN OUT'

      expect(page).to have_content 'Signed out successfully.'
    end
  end
end
