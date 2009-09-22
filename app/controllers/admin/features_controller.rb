class Admin::FeaturesController < Admin::BaseController
  resource_controller
  before_filter :product_features

  create.response do |format|
    format.html { redirect_to admin_features_url }
  end
  update.response do |format|
    format.html { redirect_to admin_features_url }
  end

private

  def product_features
    if params[:product_id]
      @product = Product.find_by_param(params[:product_id]) || Product.find_by_id(params[:product_id])
      @product_features ||= @product.features
    end
  end

  def load_objects
    if params[:id]
      @feature = Feature.find_by_param(params[:id]) || Feature.find_by_id(params[:id])
    end
  end
end
