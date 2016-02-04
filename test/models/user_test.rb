require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: 'Test',
                     name: 'Test',
                     email: 'test@test.te',
                     password_digest: 111111)
    @user.save
  end
  test "should be valid" do
    assert @user.valid?
  end
  test "name should be present" do
    @user.name = "      "
    @user.save
    assert_not @user.valid?
  end

  test "username should be present" do
    @user.username = "      "
    @user.save
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "      "
    @user.save
    assert_not @user.valid?
  end
end
