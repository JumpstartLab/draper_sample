class Order < ActiveRecord::Base
  attr_accessible :status
  
  has_many :order_items, :dependent => :destroy
  belongs_to :user
  
  def total
    #order_items.collect{|order_item| order_item.subtotal}.sum
    #order_items.inject(0){|total, item| total + item.subtotal}
    order_items.collect(&:subtotal).sum
  end
  
  def build_or_increment_order_item_by_product_id(product_id)
    order_item = order_items.find_or_initialize_by_product_id(product_id,
                      :quantity => OrderItem::DEFAULT_QUANTITY)    
    order_item.quantity += 1 unless order_item.new_record?
    return order_item
  end
  
  def create_or_increment_order_item_by_product_id(product_id)
    order_item = build_or_increment_order_item_by_product_id(product_id)
    order_item.save!
    return order_item
  end
  
end
