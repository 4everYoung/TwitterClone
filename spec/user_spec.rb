require 'rails_helper'

describe User do
  before :each do
    @user = User.new(name: "Teddy", username: "DarkNight", email: "mail@mail.ru")
  end

  describe "#new" do
    it "returns a new user object" do
      @user.should be_an_instance_of User
    end

    it "throws an ArgumentError when given fewer then 2 parameters" do
      lambda { User.new "name", "username"}.should raise_exception ArgumentError
    end
  end

end