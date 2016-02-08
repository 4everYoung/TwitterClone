require 'rails_helper'


describe UsersController do
  before :each do
    user_params = {name: 'Mike', username: 'Tyson', email: 'Tyson@Mike.com'}
    @user = User.new(user_params)
  end

  describe "GET #create" do
    context "with valid attributes" do
      it "returns a new user object" do
        @user.should be_an_instance_of User
      end
    end

  describe "GET #new" do
    context "with valid attributes" do
      it "returns a new user object" do
        @user.should be_an_instance_of User
      end
    end
  end

    describe "GET #index" do

    end
  end
end
