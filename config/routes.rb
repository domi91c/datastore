Rails.application.routes.draw do
  root :to => "visitors#index"
  devise_for :users
  resources :users do
	  resources :profiles
  end
  resources :requests

  resources :profiles





  resources :walls do
	  resources :galleries
  end

#  resources :locations

  resources :requests do
	  resources :galleries
  end

  resources :offers


  resources :pictures



  resources :messages do
	  member do
		  post :new
	  end
	  collection do
		  get :reply
	  end
  end
  resources :conversations do
	  member do
		  get  :reply
		  post :reply
		  post :trash
		  post :untrash
	  end
	  collection do
		  get :trashbin
		  post :empty_trash
	  end
  end




end
