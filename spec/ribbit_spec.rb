require 'rails_helper'

describe Ribbit do
  before :each do
    @ribbit = Ribbit.new(content: "new tweet")
  end

  describe "#new" do
    it "returns a new ribbit object" do
      @ribbit.should be_an_instance_of Ribbit
    end

    it "throws an ArgumentError when given fewer then 2 parameters" do
      lambda { Ribbit.new "content", "user_id"}.should raise_exception ArgumentError
    end
  end

  describe "#content" do
    it "returns the correct content" do
      @ribbit.content.should eql "new tweet"
    end
  end
end