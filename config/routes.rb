Rails.application.routes.draw do
  resources :user_allergies
  resources :recipes
  resources :ingredients
  resources :recipe_ingredients
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
