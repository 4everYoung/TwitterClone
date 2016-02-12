require 'rails_helper'
require 'user'
describe User do
  it "is valid with name, username, email" do
    @user = User.new(id: 999, username: "DarkNight", name: "Teddy",  email: "MaiL@mail.ru", password_digest: "123456", avatar_url: "//", created_at: 2016-01-01, updated_at: 2016-02-02)
    expect(@user).to be_valid
  end
  it "is invalid without name" do
    @user = User.new(id: 999, username: "DarkNight", email: "MaiL@mail.ru", password_digest: "123456", avatar_url: "//", created_at: 2016-01-01, updated_at: 2016-02-02)
    expect(@user).to be_invalid
  end
  it "is invalid without an email address" do
    @user = User.new(id: 999, username: "DarkNight", name: "Teddy", password_digest: "123456", avatar_url: "//", created_at: 2016-01-01, updated_at: 2016-02-02)
    expect(@user).to be_invalid
  end
  before :each do
    @user = User.new(name: "Teddy", username: "DarkNight", email: "MaiL@mail.ru")
  end

  describe "#new" do
    it "returns a new user object" do
      @user.should be_an_instance_of User
    end

    it "throws an ArgumentError when given fewer then 2 parameters" do
      lambda { User.new "name", "username"}.should raise_exception ArgumentError
    end
  end

  describe @user do
    it 'can test prep_email' do
      @user.send(:prep_email) == 'mail@mail.ru'
    end
  end

  describe @user do
    it 'can test create_avatar_url' do
      @user.send(:create_avatar_url) == "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest('mail@mail.ru')}?s=50"
    end
  end
end