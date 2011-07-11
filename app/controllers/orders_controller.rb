class OrdersController < ApplicationController
  before_filter :load_order, :except => [:merge]
  before_filter :check_order_editability, :only => [:edit, :update, :purchase, :destroy, :merge]
  
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
    @order.update_attributes( :address_id => params[:order][:address_id], 
                              :status => "submitted")
    session[:order_id] = nil
    render :show
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
