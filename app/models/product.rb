class Product < ActiveRecord::Base
  attr_accessible :title, :price, :description, :image_url
  
  validates_numericality_of :price
  
  def price=(data)
    data.delete!("$")
    super
  end
end
