class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :image, :image_cache
  mount_uploader :image, ProductImageUploader

  validates_presence_of :name, :description, :price
  validates_numericality_of :price, :only_integer => true, :greater_than => 0 
  validates_uniqueness_of :name
end
