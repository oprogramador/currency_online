Tshtask::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users, except: [:show, :index]
  resources :money, except: [:delete, :edit, :update, :create, :new] do
    collection do
      post 'refresh_rates'
      get 'report'
    end
  end
end
