class OrderItem < ActiveRecord::Base
  attr_accessible :product_id, :order_id, :quantity
  
  belongs_to :order
  belongs_to :product
  
  def subtotal
    quantity * product.price
  end
end
