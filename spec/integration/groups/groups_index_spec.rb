require 'rails_helper'

RSpec.feature 'Category page', js: true, type: :feature do
  background do
    visit users_path
    click_link 'Log in'
    @first_user = User.create(name: 'Sammie', email: 'sammie@gmail.com',
                              password: 'abcdefg')

    @second_user = User.create(name: 'Alice',
                               email: 'alice@gmail.com', password: 'abcdefg')

    @first_category = Group.create(id: 1, name: 'Food', author: @first_user)

    @first_user.groups << @first_category

    @record = Record.create(name: 'Junk', amount: 1000, author: @first_user)
    @first_category.records << @record

    fill_in 'user_email', with: @first_user.email
    fill_in 'user_password', with: @first_user.password
    click_button 'Log in'
  end

  describe 'Successful Login' do
    it 'has view for all categories' do
      expect(page).to have_content('CATEGORIES')
    end

    it 'shows total number of records for category' do
      expect(page).to have_content(@first_category.total_record)
    end
  end

  describe 'When add category is clicked, ' do
    it 'redirects to the new category page' do
      click_link 'NEW CATEGORY'
      expect(current_path).to eql(new_group_path)
    end
  end
end
