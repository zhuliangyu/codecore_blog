Rails.application.routes.draw do

  #
  # get 'comments/new'
  #
  # get 'comments/create'
  #
  # get 'comments/show'
  #
  # get 'comments/edit'
  #
  # get 'comments/update'
  #
  # get 'comments/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/" => "home#index",as: :home
  post "/search"=>"posts#search"

  resources :posts do
    resources :comments,only: [:create, :destroy]

  end



end
