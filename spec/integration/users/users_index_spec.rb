require 'rails_helper'

RSpec.feature 'User page', js: true, type: :feature do
  background do
    visit users_path
  end

  describe 'Successful Page Load' do
    it 'has log in button' do
      expect(page.has_link?('Log in')).to be true
    end

    it 'has sign up button' do
      expect(page.has_link?('Log in')).to be true
    end
  end

  describe 'When Log in is clicked, ' do
    it 'redirects to the log in page' do
      click_link 'Log in'
      expect(current_path).to eql(new_user_session_path)
      expect(page).to have_content('Forgot your password ?')
    end
  end

  describe 'When Sign up is clicked, ' do
    it 'redirects to the Sign up page' do
      click_link 'Sign Up'
      expect(current_path).to eql(new_user_registration_path)
      expect(page).to have_content('REGISTER')
    end
  end
end
