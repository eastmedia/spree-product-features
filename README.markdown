Spree Product Features
=========================

Spree Product Features is an extension for the Spree E-Commerce Platform (http://spreecommerce.com/) that allows you to associate products with features. In this extension, features are just objects with names and images.

Usage
=====

>> @feature = Feature.create(:name => '10 year warranty', :image => File.open('images/10_year_warranty.png', 'rb'))

>> @product.features << @feature
>> @product.features.delete(@feature)

