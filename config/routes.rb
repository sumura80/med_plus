Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do 
  	resources :likes, only: [:create, :destroy]
  	resources :comments do
	  	resources :votes, only: [:create, :destroy]
	  end
  end

  #userのshowページ作成URL
  resources :users, only:[:show, :edit, :update]
  root 'posts#index'
end
