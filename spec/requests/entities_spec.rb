require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  before(:each) do
    @user = User.new(name: 'Darik', email: 'r.m.darik@mail.com', password: '123456')
    @user.save
    @group = Group.new(name: 'Housing',
                       icon: 'https://www.pngfind.com/pngs/m/285-2855803_housing-icon-hd-png-download.png',
                       user: @user)
    @group.save
    @entity = Entity.new(name: 'Bed', amount: 20, user: @user)
    sign_in(@user)
  end

  it 'show index template' do
    get group_entities_path(@group)
    expect(response).to render_template('index')
  end

  it 'Get 200 status' do
    get group_entities_path(@group)
    expect(response).to have_http_status(200)
  end
end
