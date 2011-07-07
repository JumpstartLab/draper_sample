Jsmerchant::Application.routes.draw do
  resources :orders, :products
  resources :order_items, :only => [:create, :edit, :update, :destroy]
  
  root :to => "products#index"
end
