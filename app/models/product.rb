class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :image, :image_cache
  mount_uploader :image, ProductImageUploader

  validates_presence_of :name, :description, :price

end
