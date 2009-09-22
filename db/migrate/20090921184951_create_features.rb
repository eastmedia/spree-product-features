class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.string    :name
      t.string    :image_file_name
      t.string    :image_content_type
      t.integer   :image_file_size
      t.datetime  :image_updated_at

      t.timestamps
    end

    create_table :features_products, :id => false do |t|
      t.integer :feature_id
      t.integer :product_id
    end
  end

  def self.down
    drop_table :features_products

    drop_table :features
  end
end
