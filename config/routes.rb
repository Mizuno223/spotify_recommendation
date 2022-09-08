Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
  get "/" => "home#index"

  get "musics/search" => "musics#search"
  get "musics/input" => "musics#input" 
end
