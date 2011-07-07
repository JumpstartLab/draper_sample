class OrderItem < ActiveRecord::Base
  attr_accessible :product_id, :order_id, :quantity
  
  belongs_to :order
  belongs_to :product
  
  DEFAULT_QUANTITY = 1
  
  validates_numericality_of :quantity, :greater_than => 0, :only_integer => true
  
  def subtotal
    quantity * product.price
  end
end
