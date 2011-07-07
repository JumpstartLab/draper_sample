class OrderItemsController < ApplicationController
  before_filter :load_order

  def index
    @order_items = OrderItem.all
  end

  def show
    @order_item = OrderItem.find(params[:id])
  end

  def new
    @order_item = @order.order_items.new(:product_id => params[:product_id])
  end

  def create
    @order_item = OrderItem.new(params[:order_item])
    if @order_item.save
      redirect_to order_path(@order_item.order), :notice => "Successfully created order item."
    else
      render :action => 'new'
    end
  end

  def edit
    @order_item = OrderItem.find(params[:id])
  end

  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update_attributes(params[:order_item])
      redirect_to @order_item, :notice  => "Successfully updated order item."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to @order_item.order, :notice => "Successfully destroyed order item."
  end
end
