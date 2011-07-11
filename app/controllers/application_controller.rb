class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
private
  def load_order
    if current_user
      if params[:id] && controller_name == "orders"
        @order = current_user.orders.find(params[:id])
      else
        @order = current_user.orders.find_or_initialize_by_id(session[:order_id], :status => "unsubmitted")
      end
    else
      @order = Order.find_or_initialize_by_id(session[:order_id], :status => "unsubmitted")
    end
    if @order.new_record?
      @order.save!
      session[:order_id] = @order.id
    end
    
    return @order
  end  
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  
  def check_order_editability
    unless @order.editable?      
      redirect_to cart_path, :notice => "Sorry, that order is not accessible."
    end
  end
end
