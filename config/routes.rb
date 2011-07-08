Jsmerchant::Application.routes.draw do
  resources :orders do
    member do
      put :merge
    end
  end
  
  resources :products
  resources :order_items, :only => [:create, :edit, :update, :destroy]
  
  root :to => "products#index"
  
  match "/auth/twitter/callback", :to => "sessions#create"
  match "/auth/failure", :to => "sessions#failure"
  match "/logout", :to => "sessions#destroy"
  match "/login" => redirect("/auth/twitter")
  match "/cart", :to => "orders#show"
end
