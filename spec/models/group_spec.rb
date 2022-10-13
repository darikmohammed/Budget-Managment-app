require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.new(name: 'Darik', email: 'r.m.darik@mail.com', password: '123456')
    @user.save
    @group = Group.new(name: 'Housing',
                       icon: 'https://www.pngfind.com/pngs/m/285-2855803_housing-icon-hd-png-download.png',
                       user: @user)
    @group.save
  end

  it 'requires name' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'requires icon' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end
end
