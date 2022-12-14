require 'rails_helper'

RSpec.describe 'Integration', type: :system do
  before(:each) do
    @user = User.new(name: 'Darik', email: 'r.m.darik@mail.com', password: '123456')
    @user.save
    @group = Group.new(name: 'Housing',
                       icon: 'https://www.pngfind.com/pngs/m/285-2855803_housing-icon-hd-png-download.png',
                       user: @user)
    @group.save
    sign_in(@user)
  end

  describe 'Categories' do
    it 'show the header' do
      visit '/groups'
      expect(page.body).to include('Categories')
    end

    it 'Group icon redirects expenses path' do
      visit '/groups'
      find('a', text: 'Housing').click
      sleep(0.1)
      expect(page.body).to include('Transactions')
    end

    it 'Add new category redirects to category' do
      visit '/groups'
      click_on('Add Category group')
      sleep(0.1)
      expect(page.body).to include('New Category')
    end
  end

  describe 'Transaction' do
    it 'Add a new expense redirects to expense' do
      visit "/groups/#{@group.id}/entities"
      click_on('New Transaction')
      sleep(0.1)
      expect(page.body).to include('New Transaction')
    end
  end
end
