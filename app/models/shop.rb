class Shop < ActiveRecord::Base
  attr_accessible :description, :lines_summary, :name, :image, :image_cache
  mount_uploader :image, ShopImageUploader
end
