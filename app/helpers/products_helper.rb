module ProductsHelper
  def print_stock(quantity)
    if quantity > 0
      content_tag :span, "In Stock (#{quantity})", :class => "in_stock"
    else
      content_tag :span, "Out of Stock", :class => "out_stock"      
    end
  end
  
  def product_image(filename)
    image_tag "/images/products/#{filename}"
  end
end
