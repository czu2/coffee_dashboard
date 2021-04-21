Rails.application.routes.draw do
  
  resources :coffee_sales
  root "coffee_sales#index"

end
