class Feature < ActiveRecord::Base
  validates_presence_of :name
  has_and_belongs_to_many :products
  has_attached_file :image
end
