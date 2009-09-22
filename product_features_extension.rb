# Uncomment this if you reference any of your controllers in activate
require_dependency 'application'

class ProductFeaturesExtension < Spree::Extension
  version "1.0"
  description "Gives you the ability to add features to products using a habtm association. Features are simply a name with an associated image."
  url "http://github.com/eastmedia/spree-product-features"

  def self.require_gems(config)
    config.gem "thoughtbot-factory_girl", :lib => "factory_girl", :source => "http://gems.github.com"
    config.gem "faker"
  end

  def activate
    Product.class_eval do
      has_and_belongs_to_many :features
    end

    Admin::ProductsController.class_eval do
      include ActionView::Helpers::TextHelper

      def add_feature
        @product = Product.find_by_param(params[:product_id]) || Product.find_by_id(params[:product_id])
        @product.features << Feature.find_all_by_id(params[:product][:feature_ids])
        @features = @product.features
        flash[:notice] = "Successfully added #{@features.map(&:name).sort.join(',')} as #{pluralize(@features.size, 'feature')}!"
        redirect_to admin_product_features_url(@product)
      end

      def remove_feature
        @product = Product.find_by_param(params[:product_id]) || Product.find_by_id(params[:product_id])
        @feature = Feature.find_by_id params[:feature_id]
        @product.features.delete(@feature)
        flash[:notice] = "Successfully removed #{@feature.name} from #{@product.name}'s features!"
        @features = @product.features
        redirect_to admin_product_features_url(@product)
      end
    end

  end

  Admin::BaseController.class_eval do
    before_filter :add_features_tab

    private
    def add_features_tab
      @product_admin_tabs << {:name => t('features'), :url => "admin_product_features_url"}
    end
  end
end
