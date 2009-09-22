require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::ProductsController do
  before do
    activate_authlogic
    @admin = create_admin
    UserSession.create(@admin)

    @product    = Factory(:product)
    @feature    = Factory(:feature)
    @feature2   = Factory(:feature)
  end

  it "#adds a feature to the product" do
    put :add_feature, :product_id => @product.id, :product => { :feature_ids => [@feature.id] }
    @product.features.should include(@feature)
    flash[:notice].should =~ /successfully added/i
  end

  it "#adds multiple features to the product" do
    put :add_feature, :product_id => @product.id, :product => { :feature_ids => [@feature.id, @feature2.id] }
    @product.features.should include(@feature)
    @product.features.should include(@feature2)
    flash[:notice].should =~ /successfully added/i
  end

  it "#removes an feature from the product" do
    delete :remove_feature, :product_id => @product.id, :feature_id => @feature.id
    @product.features.should_not include(@feature)
    flash[:notice].should =~ /successfully removed/i
  end

  def create_admin
    u = Factory(:user)
    u.roles << Factory(:role, :name => 'user')
    u.roles << Factory(:role, :name => 'admin')
    u
  end
end
