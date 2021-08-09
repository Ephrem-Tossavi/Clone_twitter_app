Rails.application.routes.draw do
  #resources :posts
  root "posts#index"
  resources :posts do
    collection do
      post :confirm
    end
  end
end
