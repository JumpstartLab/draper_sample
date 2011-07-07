class OrderItemsController < ApplicationController
  before_filter :load_order

  def create
    @order.create_or_increment_order_item_by_product_id(params[:product_id])
    redirect_to @order, :notice => "Added the item to the order."
  end

  def edit
    @order_item = OrderItem.find(params[:id])
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    if @order_item.update_attributes(params[:order_item])
      redirect_to @order, :notice  => "Successfully updated order item."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order.order_items.destroy(params[:id])
    redirect_to @order, :notice => "Successfully destroyed order item."
  end
end

# Unusued code from Create:
# Option 1: Increment Everything
# @order_item = @order.order_items.find_or_initialize_by_product_id(
#                       params[:product_id],
#                       :quantity => 0)
#     @order_item.quantity += 1

# Option 2: Increment only existing records
# @order_item = @order.order_items.find_or_initialize_by_product_id(
#                   params[:product_id],
#                   :quantity => OrderItem::DEFAULT_QUANTITY)
# 
# @order_item.quantity += 1 unless @order_item.new_record?

# Option 3: Delegate This Responsibility to the Order

