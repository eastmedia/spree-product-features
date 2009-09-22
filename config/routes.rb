# Put your extension routes here.

map.namespace :admin do |admin|
  admin.resources :features
  admin.resources :products, :member => {:features => :get} do |product|
    product.resources :features, :member => {:remove => :delete}, :collection => {:add => :post}
  end
end
