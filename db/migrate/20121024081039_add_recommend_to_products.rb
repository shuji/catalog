class AddRecommendToProducts < ActiveRecord::Migration
  def change
    add_column :products, :recommend, :boolean, :default => false
  end
end
