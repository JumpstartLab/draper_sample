class OrdersController < ApplicationController
  before_filter :load_order, :except => [:merge]
  
  def index
    @orders = current_user.orders
  end

  def show
  end

  def edit
  end
  
  def merge
    order = current_user.orders.find(session[:order_id])
    order.merge_items_from_order_id(params[:id])
    redirect_to order, :notice => "Merged in items from Order #{params[:id]}"
  end

  def update
    if @order.update_attributes(params[:order])
      redirect_to @order, :notice  => "Successfully updated order."
    else
      render :action => 'edit'
    end
  end
  
  def purchase
    # Find the order
    # Set the address_id
    # Change the status to "submitted"
    # Save it
    # Remove the order_id from the session so they can't edit it
    # Display a thank you page with an order summary
    #
    # BONUS: From the Orders index let's "disable" orders that have
    #   been submitted (no editing, no merging, no adding, etc)
  end

  def destroy
    @order.destroy
    session[:order_id] = nil if (session[:order_id] == params[:id].to_i)
    redirect_to products_path, :notice => "Successfully destroyed order."
  end
  
  def create
    session[:order_id] = nil
    redirect_to products_path, :notice => "Created a New Order"
  end
end
