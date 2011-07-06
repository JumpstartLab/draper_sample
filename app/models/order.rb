class Order < ActiveRecord::Base
  attr_accessible :customer_id, :status
  
  has_many :order_items
end
