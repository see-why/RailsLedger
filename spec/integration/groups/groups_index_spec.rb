require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.feature 'Category page', js: true, type: :feature do
  background do
    visit users_path
    click_link 'Log in'
    @first_user = User.create(name: 'Sammie', email: 'sammie@gmail.com',
                              password: 'abcdefg')

    @second_user = User.create(name: 'Alice',
                               email: 'alice@gmail.com', password: 'abcdefg')

    @first_category = Group.create(id: 1, name: 'Food', author: @first_user)

    @first_category.icon.attach(
      io: File.open(Rails.root.join('spec', 'images', 'ham.png')),
      filename: 'ham.png',
      content_type: 'application/png'
    )

    @first_category.save!

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

  describe 'Categories home page' do
    it 'should see users categories' do
      expect(page).to have_content 'Food'
    end

    it 'should show total amount' do
      expect(page).to have_content '1000'
    end

    it 'should have redirect to show page when you click category name' do
      click_link @first_category.name
      expect(current_path).to eql(group_path(id: @first_category.id))
    end
  end
end
# rubocop:enable Metrics/BlockLength
