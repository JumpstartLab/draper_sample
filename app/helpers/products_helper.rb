module ProductsHelper
  def print_stock(stock, requested = 1)
    if stock >= requested
      content_tag :span, "In Stock (#{stock})", :class => "in_stock"
    elsif stock > 0
      content_tag :span, "Insufficient Stock (only #{stock})", :class => "low_stock"      
    else
      content_tag :span, "Out of Stock", :class => "out_stock"            
    end
  end
  
  def product_image(filename)
    image_tag "/images/products/#{filename}"
  end
end
