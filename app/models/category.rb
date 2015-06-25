class Category < ActiveRecord::Base
  has_many :items
  has_attached_file :general_img, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :general_img, :content_type => /\Aimage\/.*\Z/
end
