require 'rails_helper'

describe ApplicationController, type: :controller do
  before :each do
    @user_params = {id: 999, username: "DarkNight", name: "Teddy",  email: "MaiL@mail.ru", password_digest: "123456", avatar_url: "//", created_at: 2016-01-01, updated_at: 2016-02-02}
    @user = User.new(@user_params)
  end

  describe "current user" do
      it "should return true" do
        :current_user; {id: @user.id}.should == {id: @user.id}
      end
  end
end
