class OrdersController < ApplicationController
  before_filter :load_order, :except => [:index]
  
  def index
    @orders = Order.all
  end

  def show
  end

  def edit
  end

  def update
    if @order.update_attributes(params[:order])
      redirect_to @order, :notice  => "Successfully updated order."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order.destroy
    session[:order_id] = nil
    redirect_to products_path, :notice => "Successfully destroyed order."
  end
end
