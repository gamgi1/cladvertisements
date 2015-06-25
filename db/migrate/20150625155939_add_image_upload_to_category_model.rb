class AddImageUploadToCategoryModel < ActiveRecord::Migration
  def up
    add_attachment :categories, :general_img
  end
  def down
    remove_attachment :categories, :general_img
  end
end
