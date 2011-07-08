Jsmerchant::Application.routes.draw do
  resources :orders, :products
  resources :order_items, :only => [:create, :edit, :update, :destroy]
  
  root :to => "products#index"
  
  match "/auth/twitter/callback", :to => "sessions#create", :as => "login"
  match "/auth/failure", :to => "sessions#failure"
  match "/logout", :to => "sessions#destroy"
end
