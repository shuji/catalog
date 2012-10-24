class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.text :description
      t.text :lines_summary

      t.timestamps
    end
  end
end
