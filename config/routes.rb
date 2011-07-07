Jsmerchant::Application.routes.draw do
  resources :orders, :order_items, :products
end
