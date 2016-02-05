require 'rails_helper'
=begin

describe Relationship do
  before :each do
    @relationship = Relationship.new(followed_id: 1, follower_id: 2)
  end

  describe "#new" do
    it "returns a new relationship object" do
      @relationship.should be_an_instance_of Relationship
    end

    it "throws an ArgumentError when given fewer then 2 parameters" do
      lambda { Relationship.new "followed_id"}.should raise_exception ArgumentError
    end
  end
end

=end