module ProductsHelper
  def print_price(price)
    number_to_currency(price)
  end
  
  def print_stock(quantity)
    if quantity > 0
      content_tag :span, "In Stock (#{quantity})", :class => "in_stock"
    else
      content_tag :span, "Out of Stock", :class => "out_stock"      
    end
  end
end
