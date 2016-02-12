require 'rails_helper'
require 'users_controller'


describe UsersController, type: :controller do
  before :each do
    @user_params = {id: 999, username: "DarkNight", name: "Teddy",  email: "MaiL@mail.ru", password_digest: "123456", avatar_url: "//", created_at: 2016-01-01, updated_at: 2016-02-02}
    @user = User.new(@user_params)
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

    describe "GET #show" do
      it "renders show template if user is found" do
        @user_params = {id: 999, username: "DarkNight", name: "Teddy",  email: "MaiL@mail.ru", password_digest: "123456", avatar_url: "//", created_at: 2016-01-01, updated_at: 2016-02-02}
        @user = User.new(@user_params)
        get :show, {id: @user.id}
        response.should render_template('users/show')
      end
    end

    describe "GET #index" do
      it "renders index template" do
        get 'index'
        response.should render_template('users/index')
      end
    end

    describe "GET #buddies" do
      it "renders buddies template" do
        :buddies
        expect(response).to have_http_status(200)
      end
    end
  end
end
