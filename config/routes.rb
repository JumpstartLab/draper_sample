Jsmerchant::Application.routes.draw do
  resources :addresses

  resources :orders do
    member do
      put :merge
      put :purchase
    end
  end
  
  resources :products
  resources :order_items, :only => [:create, :edit, :update, :destroy]
  
  root :to => "products#index"
  
  match "/auth/:provider/callback", :to => "sessions#create"
  match "/auth/failure", :to => "sessions#failure"
  match "/logout", :to => "sessions#destroy"
  #match "/login" => redirect("/auth/twitter")
  match "/login_twitter" => redirect("/auth/twitter")
  match "/login_github" => redirect("/auth/github")
  match "/cart", :to => "orders#show"
end
