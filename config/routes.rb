Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  # Example route for articles controller (you can modify or remove this if not needed)
  # root "articles#index"

  # Route for the newsfeed action in the PostsController
  get '/newsfeed', to: 'posts#newsfeed', as: :newsfeed
  get '/search/users', to: 'search#users', as: :search_users
  get '/search/posts', to: 'search#posts', as: :search_posts
end
