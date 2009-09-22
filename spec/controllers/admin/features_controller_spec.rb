require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::FeaturesController do
  before do
    activate_authlogic
    @admin = create_admin
    UserSession.create(@admin)

    @product    = Factory(:product)
    @feature    = Factory(:feature)
    @feature2   = Factory(:feature)
  end

  it "#creates a feature" do
    lambda { post :create, :feature => { :name => 'foo' } }.should change(Feature, :count).by(1)
    response.should be_redirect
  end

  it "#updates a feature" do
    put :update, :id => @feature.id, :feature => { :name => 'bar' }
    @feature.reload
    @feature.name.should == 'bar'
    response.should be_redirect
  end

  def create_admin
    u = Factory(:user)
    u.roles << Factory(:role, :name => 'user')
    u.roles << Factory(:role, :name => 'admin')
    u
  end
end
