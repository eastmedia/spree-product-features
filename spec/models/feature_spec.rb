require File.dirname(__FILE__) + '/../spec_helper'

describe Feature do
  before do
    @feature = Feature.new
  end

  it "should require a name" do
    @feature.should validate_presence_of(:name)
  end
  it "should have and belong to many products" do
    @feature.should have_and_belong_to_many(:products)
  end
end
