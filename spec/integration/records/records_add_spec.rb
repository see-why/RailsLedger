require 'rails_helper'
# rubocop:disable Metrics/BlockLength

RSpec.feature 'Record page', js: true, type: :feature do
  background do
    visit users_path
    click_link 'Log in'
    @first_user = User.create(name: 'Sammie', email: 'sammie@gmail.com',
                              password: 'abcdefg')

    @second_user = User.create(name: 'Alice',
                               email: 'alice@gmail.com', password: 'abcdefg')

    fill_in 'user_email', with: @first_user.email
    fill_in 'user_password', with: @first_user.password
    click_button 'Log in'
    visit new_record_path
  end

  describe 'Successful Loading of page' do
    it 'has Categories select options section' do
      expect(page).to have_content('Categories')
    end

    it 'has record name text field' do
      expect(page.body).to include('placeholder="Name"')
    end

    it 'has record amount number field' do
      expect(page.body).to include('placeholder="Amount"')
    end
  end

  describe 'When add record is clicked without selecting a category' do
    it 'redirects back to new record page' do
      fill_in 'record_name', with: 'Food'
      fill_in 'record_amount', with: 100
      click_button 'Save'
      expect(current_path).to eql(new_record_path)
    end
  end
end

# rubocop:enable Metrics/BlockLength
