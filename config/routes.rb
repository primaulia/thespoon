Rails.application.routes.draw do
  resources :restaurants do
    # customize for all '/restaurants' paths
    collection do
      get 'top', to: 'restaurants#top'
    end

    # customize for all '/restaurants/:id' paths
    member do # /restaurants/:id/chef
      get 'chef', to: 'restaurants#chef'
    end

    # two routes i want to create for reviews
    # /restaurants/:restaurant_id/reviews/:id
    resources :reviews, only: [:new, :create]
  end

  namespace :admin do
    resources :restaurants, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
