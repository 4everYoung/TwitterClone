require 'rails_helper'
require 'sessions_controller'

describe SessionsController, type: :controller do
  before :each do
    @user_params = {id: 4, username: "DarkNight", name: "Teddy",  email: "MaiL@mail.ru", password_digest: "123456", avatar_url: "//", created_at: 2016-02-01, updated_at: 2016-03-02}
    @user = User.new(@user_params)
  end

  describe 'create' do
     it 'should be eq to user_id' do
       @user.save
       get 'create'
       session[:user_id].should == @user.id
     end
  end

  describe 'destroy' do
      it 'should be eq nil' do
         get 'destroy'
         session[:user_id].should == nil
      end
  end
end