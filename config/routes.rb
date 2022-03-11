Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/" => "musics#index"
  get "/search" => "musics#search"
  get "/show" => "musics#show"
end
