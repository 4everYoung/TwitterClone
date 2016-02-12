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

  describe "#content" do
    it "should have length smaller then 140 symbols" do
      @ribbit.content.length.should <= 140
    end
  end
  describe "#content" do
    it "throws an Error when content length more then 140 symbols" do
       rib = Ribbit.new(content: "qweqweqwe3qweqweqwe3qweqweqwe3qweqweqwe3qweqweqwe3qweqweqwe3qweqweqwe3qweqweqwe3qweqweqwe3qweqweqwe3qweqweqwe3qweqweqwe3qweqweqwe3qweqweqwe3 qweqweqwe3")
      rib.errors.get(:content) != nil
    end
  end
end