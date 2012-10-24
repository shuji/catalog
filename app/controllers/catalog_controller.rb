class CatalogController < ApplicationController
  def index
    @products = Product.all
  end

  def recommend
    @products = Product.where(recommend: true)
  end
end
