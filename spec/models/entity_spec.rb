require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:each) do
    @user = User.new(name: 'Darik', email: 'r.m.darik@mail.com', password: '123456')
    @user.save
    @group = Group.new(name: 'Housing',
                       icon: 'https://www.pngfind.com/pngs/m/285-2855803_housing-icon-hd-png-download.png',
                       user: @user)
    @group.save
    @entity = Entity.new(name: 'Bed', amount: 20, user: @user)
  end

  it 'requires name' do
    @entity.name = nil
    expect(@entity).to_not be_valid
  end

  it 'requires amount to be greater than 0' do
    @entity.amount = -1
    expect(@entity).to_not be_valid
  end

  it 'requires amount to be present' do
    @entity.amount = nil
    expect(@entity).to_not be_valid
  end
end
