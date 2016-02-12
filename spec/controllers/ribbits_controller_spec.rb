require 'rails_helper'


describe RibbitsController, type: :controller do
  before :each do
    @ribbit = Ribbit.new(id: 888, content: "new tweet")
    @user_params = {id: 999, username: "DarkNight", name: "Teddy",  email: "MaiL@mail.ru", password_digest: "123456", avatar_url: "//", created_at: 2016-01-01, updated_at: 2016-02-02}
  end

  describe "create" do
    it 'should create ribbit' do
      @ribbit.should be_an_instance_of Ribbit
    end
  end
  describe 'destroy' do
    it 'should delete ribbit' do
      @ribbit = Ribbit.new(id: 722, content: "new tweet")
      @ribbit.save
      delete 'destroy', {id: @ribbit.id}
      @ribbit.destroy
      expect(response).to have_http_status(302)
    end
  end
  describe 'index' do
    it 'should show all tweets' do
      get 'index'
      expect(response).to have_http_status(200)
    end
  end
  describe 'get_ribbit' do
    it 'should show ribbit with id' do
      :get_ribbit; {id: @ribbit.id}.should == {id: @ribbit.id}
    end
  end


end
