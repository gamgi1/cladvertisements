class Changecolumntypetocategoryname < ActiveRecord::Migration
  def change
    rename_column :categories, :type, :category_name 
  end
end
