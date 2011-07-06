class Order < ActiveRecord::Base
  attr_accessible :customer_id, :status
  
  has_many :order_items
  
  def total
    #order_items.collect{|order_item| order_item.subtotal}.sum
    #order_items.inject(0){|total, item| total + item.subtotal}
    order_items.collect(&:subtotal).sum
  end
end
